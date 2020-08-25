FROM gcr.io/spark-operator/spark-py:v3.0.0

WORKDIR /home/user

USER root
RUN useradd user && chown -R user /home/user
USER user

COPY requirements.txt /home/user
ENV PATH "$PATH:/home/user/.local/bin"

RUN pip3 install --upgrade pip
RUN pip3 install --user --no-cache-dir -r /home/user/requirements.txt


