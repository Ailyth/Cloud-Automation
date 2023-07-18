ENVIRONMENT?=my-maas-cluster

pull-dependencies: pull-python-dependencies pull-ansible-reqs

pull-ansible-reqs:
	python3.9 -m pipenv run ansible-galaxy install -r requirements.yaml \
	  --roles-path roles/galaxy
	python3.9 -m pipenv run ansible-galaxy collection install -r requirements-collections.yaml \
	  -p collections

pull-python-dependencies:
	python3.9 -m pip install --upgrade pip==22.3.1
	python3.9 -m pip install --user pipenv==2022.8.5
	python3.9 -m pipenv sync

configure-cluster: configure-control-plane configure-node-workers join-workers

configure-control-plane:
	python3.9 -m pipenv run ansible-playbook -v playbooks/configure-control-plane.yml \
	-i environments/${ENVIRONMENT}/inventory.ini

join-workers:
	python3.9 -m pipenv run ansible-playbook -v playbooks/join_workers/join_workers.yml \
	-i environments/${ENVIRONMENT}/inventory.ini

configure-node-workers:
	python3.9 -m pipenv run ansible-playbook -v playbooks/configure-kube-workers.yml \
	-i environments/${ENVIRONMENT}/inventory.ini
