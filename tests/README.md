<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Onedev, verified and packaged by Elestio

[Onedev](https://github.com/LemmyNet/lemmy.git) is a Self-hosted Git Server with CI/CD and Kanban.

<img src="https://github.com/elestio-examples/onedev/raw/main/onedev.gif" alt="onedev" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/onedev">fully managed Onedev</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you are interested in an open source all-in-one devops platform with the ability to manage git repositories, manage issues, and run continuous integrations.

[![deploy](https://github.com/elestio-examples/lemmy/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?soft=onedev)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/onedev.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:6610`

## Docker-compose

Here are some example snippets to help you get started creating a container.

      version: '3.3'
      services:
          server:
              image: elestio4test/onedev-server:${SOFTWARE_VERSION_TAG}
              volumes:
                  - '/var/run/docker.sock:/var/run/docker.sock'
                  - './data:/opt/onedev'
              ports:
                  - '172.17.0.1:6610:6610'

              environment:
                  - initial_user=${INITIAL_USER}
                  - initial_password=${ADMIN_PASSWORD}
                  - initial_email=${ADMIN_EMAIL}
                  - initial_server_url=${BASE_URL}
                  - initial_ssh_root_url=${INITIAL_SSH_ROOT_USER}

### Environment variables

|       Variable       | Value (example) |
| :------------------: | :-------------: |
| SOFTWARE_VERSION_TAG |     latest      |
|     INITIAL_USER     |      root       |
|     ADMIN_EMAIL      |  test@mail.com  |
|    ADMIN_PASSWORD    |    password     |
|     BASE_URL         |    http://url   |
|INITIAL_SSH_ROOT_USER |    http://url   |

# Maintenance

## Logging

The Elestio Onedev Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/theonedev/onedev">Onedev Github repository</a>

- <a target="_blank" href="https://docs.onedev.io/">Onedev documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/onedev">Elestio/Onedev Github repository</a>
