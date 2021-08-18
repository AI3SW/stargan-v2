FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-runtime

# https://stackoverflow.com/questions/47113029/importerror-libsm-so-6-cannot-open-shared-object-file-no-such-file-or-directo
# https://stackoverflow.com/questions/44331836/apt-get-install-tzdata-noninteractive
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libsm6 libxext6 libxrender-dev tzdata && apt-get clean

# Set timezone
# https://stackoverflow.com/questions/40234847/docker-timezone-in-ubuntu-16-04-image
ENV TIMEZONE="Asia/Singapore"
RUN echo $TIMEZONE >/etc/timezone
RUN rm /etc/localtime
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

COPY ./ /stargan-v2
WORKDIR /stargan-v2

RUN conda env create --file environment.yml

# conda activate stargan-v2 on start
RUN echo . /opt/conda/etc/profile.d/conda.sh >> ~/.bashrc
RUN echo conda activate stargan-v2 >> ~/.bashrc

EXPOSE 5000

ENV FLASK_APP=flask_app
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
