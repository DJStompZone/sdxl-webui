FROM python:3.9

RUN git clone https://github.com/DJStompZone/sdxl-webui.git

WORKDIR /sdxl-webui

RUN apt-get update && apt-get install git ffmpeg libsm6 libxext6 libgl1-mesa-glx -y

RUN pip install -r requirements.txt

ENV PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:128

CMD ["python", "app.py", "--SHARE=true"]
