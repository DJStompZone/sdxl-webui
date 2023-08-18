FROM python:3.9

WORKDIR /app

RUN git clone https://github.com/TonyLianLong/stable-diffusion-xl-demo .

RUN pip install --no-cache-dir --extra-index-url https://download.pytorch.org/whl/cu113 -r requirements.txt

ENV PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:128

CMD ["python", "app.py", "--DEFAULT_NUM_IMAGES=1", "--SHARE=true", "--ENABLE_REFINER=false"]