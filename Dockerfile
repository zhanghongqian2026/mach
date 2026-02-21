FROM nginx:alpine
COPY index.html README.md DEPLOY.md /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
