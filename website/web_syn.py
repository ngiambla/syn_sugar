import os
import sys

from flask import Flask, render_template, request, redirect, url_for, flash, jsonify
from werkzeug.utils import secure_filename

import syn_sugar
import pdf2txt as pdf2txt

UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = set(['txt', 'pdf'])

app = Flask(__name__)
app.secret_key = '22GHyyUTThGSDSX'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

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

@app.route("/queries", methods=['POST'])
def queries():
	query_data="PICKLE_MAN"
	q=1
	for i in range(0, 1000):
		for j in range (0, 200):
			q=q+1*q

	return query_data
