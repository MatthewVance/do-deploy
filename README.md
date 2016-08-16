This is a simple script to deploy a Digitialocean droplet with their v2 API. It uses cloud-init for configuration to ensure the server has some basic security hardening as soon as it is provisioned. 

Before running: 

1. Replace `hostname_here` in deploy.sh with desired hostname.
2. Replace `root_public_key_finterprint_here` in deploy.sh with your root account's SSH public key fingerprint (obtain it via `ssh-keygen -E md5 -lf ~/.ssh/id_ed25519_root.pub`).
3. Replace `sudo_public_key_here` with your sudo user's public key in user-data.yaml (obtain it via `cat ~/.ssh/id_ed25519_sudo.pub`).
4. Replace `user_name_here` in the users name field and sed command for AllowUsers in user-data.yaml.
5. Set Digitialocean API key Bash variable (`export TOKEN=your_api_key`).

Once the above is complete, make the `deploy.sh` script executable (`chmod 744 deploy.sh`) and run it (`./deploy.sh`). Wait a couple of minutes before attempting to SSH to the droplet after the server is built to make sure it has time to apply all the changes.

It has been tested with Debian Jessie, but should work with other Debian-based distros.

*References*
- https://developers.digitalocean.com/documentation/v2/#create-a-new-droplet
- http://cloudinit.readthedocs.io/en/latest/
- https://www.digitalocean.com/community/tutorials/how-to-use-cloud-config-for-your-initial-server-setup