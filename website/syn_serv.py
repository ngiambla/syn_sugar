from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def root():
    return render_template("index.html")

@app.route("/uploads",  methods=['POST'])
def uploads():
	summary=""

	return summary


@app.route("/querys", methods=['POST'])
def queries():
	query_data={}
	

	return query_data