import os
import sys

from flask import Flask, render_template, request, redirect, url_for, flash, jsonify
from werkzeug.utils import secure_filename

import syn_sugar
import pdf2txt as pdf2txt

UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = set(['txt', 'pdf'])

app = Flask(__name__) 				#create app instance.
app.config.from_object(__name__) # load config from this file , flaskr.py

# Load default config and override config from an environment variable
app.config.update(dict(
	UPLOAD_FOLDER=UPLOAD_FOLDER,
    SECRET_KEY='\xc9\xd2\xb3\x96\x9b\xb8\x1c\x1b\xfe\xe8\xe9\xf3\xbf\x89\\\xa5\xd7\x95\x1d\x8f\xae\xb3\x05\xa1'
))

app.config.from_envvar('FLASKR_SETTINGS', silent=True)

def allowed_file(filename):
	return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route("/")
def root():
    return render_template("index.html")

@app.route("/uploads",  methods=['POST'])
def uploads():
	if 'upload-file' not in request.files:
		print("No file sent.")
		return "1"
	file = request.files['upload-file']
	if file and allowed_file(file.filename) and file.filename != "":
		try:
			filename = secure_filename(file.filename)
			file.save(os.path.join(app.config['UPLOAD_FOLDER'], "__1_"+filename))
			if "pdf" == filename.rsplit('.', 1)[1].lower():
				pdf2txt.convert("uploads/__1_"+filename)
				print("About to remove...")
				os.remove("uploads/__1_"+filename)
				filename="__1_"+filename.rsplit('.', 1)[0]+".txt"
				print("Filename: " + filename)
			summary=syn_sugar.bake()
			os.rename("uploads/"+filename, "uploads/__old_"+filename[3:])
			return jsonify(res=summary)
		except Exception as e:
			print(e)
			return "3"
	else:
		return "2"

