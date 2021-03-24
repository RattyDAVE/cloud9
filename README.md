
```
docker run -d   
  --name=cloud9   \
  -v /home/docker/configs/cloud9/code:/workspace \
  -e USERNAME=code9 \
  -e PASSWORD=code9password \
  -p 8000:8000 \
  --env VIRTUAL_HOST=cloud9.home.atdotdotcom.com \
  --env VIRTUAL_PORT=8000 \
  --env LETSENCRYPT_HOST=cloud9.home.atdotdotcom.com \
  --restart unless-stopped \
  rattydave/cloud9
```
