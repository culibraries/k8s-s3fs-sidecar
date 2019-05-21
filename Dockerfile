FROM centos
LABEL maintainer "Mark Stacy"

LABEL s3fs-sidecar.version="0.1.0" \
      s3fs-sidecar.description="Use s3 as backend for a kubernetes deployment by running as sidecar"

ENV S3_BUCKET ''
ENV MNT_POINT /data
ENV AWS_DEFAULT_REGION 'us-west-2'
ENV AWS_ACCESS_KEY_ID ''
ENV AWS_SECRET_ACCESS_KEY ''

RUN yum install -y  epel-release 
RUN yum install -y s3fs-fuse 
WORKDIR /
RUN mkdir data
RUN mkdir s3fs_credentials 
RUN chmod 777 s3fs_credentials
RUN chmod 777 data
COPY automount.sh automount.sh
CMD ["./automount.sh"]
