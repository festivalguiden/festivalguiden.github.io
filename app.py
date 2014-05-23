import csv
import urllib2
import sys
from flask import Flask
from flask import render_template
reload(sys)
sys.setdefaultencoding("utf-8")
app = Flask(__name__)
url = 'https://docs.google.com/spreadsheet/pub?key=0AggcB0yBnLRNdG5mVjBScG0tbzdXc2d3cUFjaTZxd0E&output=csv'
data = urllib2.urlopen(url)
reader = csv.DictReader(data)
csv_list = list(reader)
csv_dict = dict([[o['id'], o] for o in csv_list])

@app.route("/")
def index():
    return render_template('index.html',
    	object_list=csv_list,
    	)

@app.route('/<number>/')
def detail(number):
    return render_template('detail.html',
        object=csv_dict[number],
    )

if __name__ == '__main__':
    app.run(
        host="0.0.0.0",
        port=8000,
        use_reloader=True,
        debug=True,
    )