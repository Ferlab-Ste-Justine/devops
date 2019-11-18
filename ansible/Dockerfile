FROM python:3

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN pip install ansible

RUN ansible-galaxy install geerlingguy.docker

COPY playbooks /opt/playbooks

WORKDIR /opt

CMD ["--help"]

ENTRYPOINT ["ansible-playbook"]