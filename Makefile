setup:
	python3 -m venv .devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --cov=myrepolib tests/*.py
	python -m pytest --nbval notebook.ipynb
	docker run --volume $PWD:/mnt/locust \
			   -e LOCUSTFILE_PATH=/mnt/locust/locustfile.py \
			   -e TARGET_URL=https://abc.com \
			   -e LOCUST_OPTS="--clients=10 --no-web --run-time=600" \
			   locustio/locust
	
lint:
	hadolint --ignore DL4000 Dockerfile
	pylint --disable=R,C,W1203 app.py

all: install lint test
