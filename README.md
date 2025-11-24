# SongSleuth Setup

SongSleuth can be setup locally as well

## Requirements

### 1). Install PHP

If PHP 8 or later is already installed then this step can be skipped. To check if PHP is installed open a Command Prompt (Windows) or Terminal (MacOS/Linux) and run `php -v` This will return the version of PHP currently installed. If you receive an unrecognized command then PHP is not installed.

#### Install PHP On Windows

1. [Download PHP](https://www.php.net/downloads.php)
2. Extract the PHP zip downloaded to where you want to save it (recommended `C:\php`)
3. Updated the System PATH variable by:
    - Open the Windows Start Menu search and enter `View advanced system settings` and select it
    - Click "Environment Variables"
    - Under "System Variables" look for and select "PATH" then click "Edit"
    - Click "New" and input or browse for where you saved your PHP extract
    - Click "Ok" on each popup dialog box
4. Verify that PHP was succesfully installed by opening a Command Prompt and running `php -v`

#### Install PHP On Debian/Ubunutu Linux

1). Open a terminal and run `sudo apt install php`
2). Verify the installation by running `php -v`

Other versions of Linux may have different syntax to install PHP from the Terminal.

#### Install PHP On MacOS

1). Follow the [instructions to install PHP on Mac](https://www.php.net/manual/en/install.macosx.packages.php) found on the official PHP site.

### 2). Install XAMPP

XAMPP is a cross platform application for PHP development and hosting web applications. XAMPP works on Windows, MacOS, and Linux. When installing XAMPP be sure to install the options for Apache and MySQL (even if you already have a separate MySQL installation, as XAMPP will use the one it installs). The exact process to install XAMPP varies some by OS, so it is best to reference Apache's FAQs on the right hand side of the download page if there is an issue with your installation.

XAMPP can be downloaded here: [XAMPP Download](https://www.apachefriends.org/download.html)

## Setup SongSleuth Database

### 1). Download SongSleuth Files

On GitHub:

1. Click on the branches and click `prod`
2. Click "Code" and then "Download Zip"
3. Extract the zip contents
4. Navigate to XAMPP `htdocs` folder and create a new folder called `song_sleuth`
   - By default on Windows this folder is located at `C:\xampp\htdocs`
   - On Debian/Ubutunu Linux this folder is located at `/opt/lampp/htdocs`
5. Copy or move the extracted zip contents to the `htdocs\song_sleuth` folder you created

### 2). Create Database In phpMyAdmin

1. Start XAMPP
  - On Windows after starting XAMPP you will need to manually start the Apache server and MySQL modules by click "Start"
    - If you have another MySQL Server installed on Windows that is using port 3306 you will need to either disable it or change the port used by either XAMPP or the other MySQL server.
  - On Linux starting XAMPP should start these servcies automatically. You can start XAMPP on Linux by running `sudo /opt/lampp/lampp start`
2. Open a web browser and navigate to `https://localhost/phpmyadmin/index.php?`
3. Click On "Databases" and under "Create Database"
    - Input `song_sleuth` as the database name
    - Choose utf8_bin as the Collation
4. Click "Create"

### 3). Import SongSleuth Database Into phpMyAdmin

After the database is created we can import the SongSleuth database

1. In phpMyAdmin select the `song_sleuth` database you created
2. Click "Import" at the top
3. Browse for the `song_sleuth.sql` that you saved in the `htdocs\song_sleuth` folder
4. Click Import

This will import the table structure and all records that currently exist in the SongSleuth database

### 4). Set MySQL to Use Lower Case Table Names (Linux/Case Sensitive OS Only)

This step will only need to be done if setting up the database on a case sensitive OS, such as Linux. Windows environments can skip this step, as it is not a case sensitive OS. MacOS by default is not case sensitive, so most Mac users can skip this step. If your Mac has been configured to be case sensitive then you will need make this update.

1. Open the XAMPP MySQL config file
   - On Linux the default location for this is `/opt/lampp/etc/my.cnf`
3. Under the section `[mysqld]` add a new line containing `lower_case_table_names=1`
4. Save and close the config file

This is necessary so that the SQL queries that the PHP scripts user will work correctly on case-sensitive operating systems. Without doing this the queries will fail.
