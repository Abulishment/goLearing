# 使用nginx作为基础镜像  
FROM nginx:stable-alpine  
  
# 将当前目录下的所有文件复制到容器的/usr/share/nginx/html/目录中  
WORKDIR /usr/share/nginx/html/
COPY ./ ./  
RUN mv ./nginx.conf /etc/nginx/conf.d/default.conf
  
# 暴露80端口  
EXPOSE 80  
  
# 默认情况下，nginx的配置文件位于/etc/nginx/conf.d/default.conf  
# 如果需要自定义配置，你可以创建一个新的配置文件并放在这个目录中  
# 或者修改nginx的默认配置文件  
  
# 容器启动时执行的命令  
CMD ["nginx", "-g", "daemon off;"]