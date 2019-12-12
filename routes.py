from flask import Flask, render_template, request
import connix

cfg = {
	'title': "Dendory Flask Application",
	'user': "Guest"
}

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def index():
	if request.method == "POST":
		if "id" in request.form and "pw" in request.form:
			cfg['user'] = request.form['id']

	return render_template('index.html', cfg=cfg)


@app.route('/login')
def login():
	return render_template('login.html', cfg=cfg)


if __name__ == '__main__':
	app.run(host='0.0.0.0', port=80)
