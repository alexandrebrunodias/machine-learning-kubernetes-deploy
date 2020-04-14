from locust import HttpLocust, TaskSet, between, task
import json

payload = {"CHAS": {"0": 0}, "RM": {"0": 6.575}, "TAX": {"0": 296.0}, "PTRATIO": {"0": 15.3}, "B": {"0": 396.9}, "LSTAT": {"0": 4.98}}
headers = {'content-type': 'application/json'}

class UserBehavior(TaskSet):
    @task(1)
    def home(self):
        self.client.get("/")

    @task(2)
    def predict(self):
        self.client.post(url="/predict", json=payload, headers=headers)

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    wait_time = between(5.0, 9.0)