setup:
	python3 -m venv .devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# python -m pytest -vv --cov=myrepolib tests/*.py
	# python -m pytest --nbval notebook.ipynb
	python3 app.py &
	sleep 3
	locust -f locustfile.py --host http://localhost --no-web -c 30 -r 10 --run-time 15s
lint:
	hadolint --ignore DL4000 Dockerfile
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test