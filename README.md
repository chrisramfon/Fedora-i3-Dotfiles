# Fedora-i3-Dotfiles

En este repositorio estan los dotfiles de mi entorno i3. Se omiten algunas configuraciones que se pueden encontar en Github, como la barra de polybar, betterlockscreen, etc. Las pruebas para validar si funcionan las configuraciones que se van haciendo se realizaron en una maquina virtual. Cuando confirme que alguna modificacion funciona correcatmente, la subiré al repositorio.

## Vista previa

<p align="center">
  <img src="https://i.ibb.co/fHjRwsD/Escritorio.png">
</p>

<p align = "center"> 
    <img src ="https://i.ibb.co/WDCXLBZ/Escritorio2.png">
</p>


## Objetivo

Mi objetivo es aprender a utilizar mi primer tiling window manager mientras lo configuro a mi gusto personal. Si puedo ayudar a alguien que se encuentra en la misma situación que yo, sería genial. 

## Advertencias

Aun me faltan hacer muchas configuraciones, con el tiempo las iré subiendo aquí.

Para hacer la configuración es indispensable utilizar la consola de comandos de linux, además será necesario agregar algún comando extra, o escribirlo de otra manera si no estás utilizando Fedora i3 como yo. No soy un experto, esta es mi primera vez con un tiling window manager.
Para lograr la instalación tuve que leer mucha documentación, de la cual el 100% se encuentra en inglés, así que si eres principiante al igual que yo, te aseguro que en algún momento tendrás que leer dicha documentación.

## Requisitos o dependencias

Hasta el día de hoy estos son los programas que se necesitan para que funcionen las configuraciones. Algunos a su vez tienen otros requisitos que tienen que ser instalados, trataré de agregar su link a Github. Con el paso del tiempo, trataré de ir dejando los pasos para instalar cada una de las dependencias.

- <a href = "https://github.com/Airblader/i3/wiki/installation"><b>i3 Gaps</b></a> (En Fedora i3 es necesario remplazar el que viene por defecto por este)
- <a href = "https://github.com/polybar/polybar/wiki/"><b>Polybar</b></a> 
- <a href = "https://github.com/adi1090x/polybar-themes"><b>Polybar Themes</b></a> (Yo utilizo la barra "shapes". Si no funciona el indicador de batería, tray icons, brillo, etc, leer la documentación)
- Alacritty 
- <a href = "https://wiki.archlinux.org/title/Picom"><b>Picom</b></a> 
- Neofetch
- Ranger 
- Rofi
- Btop 
- Htop 
- Feh 
- Cava 
- Xrandr
- Lightdm webkit2 greeter

## Instalación

### Preparación

Voy a asumir que la configuración de los dotfiles se hace con una instalación limpia de Fedora i3. Antes de comenzar a hacer cualquier cosa, primero me gusta agregar algunos repositorios, porque Fedora i3 es un spin y no cuenta con los mismos repositorios que Fedora Workstation. 

Primero agrego el repositorio de Fedora Workstation con el siguiente comando.<br>
`sudo dnf install fedora-workstation-repositories`

Fedora RPM Fusion Free Repo<br>
`sudo dnf install \https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm`

Fedora RPM Fusion Non Free Repo<br>
`sudo dnf install \https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`

Después de agregar los repositorios ejecuto el siguiente comando para actualizar.<br>
`sudo dnf update`

### Alacritty

La instalación de Alacritty es muy simple ya que se encuentra en los repositorios de Fedora. Solo se tiene que ejecutar el siguiente comando.<br>
`sudo dnf install alacritty`

### Polybar

Para instalar Polybar solo es necesario ejecutar el comando para instalarlo.<br>
`sudo dnf install polybar`

Una vez instalado se debe generar el archivo de configuración. En este caso voy a tomar el archivo de ejemplo para agregarlo en la configuración. Después de generar el archivo de configuración, se debe generar un archivo con permisos de ejecución, el cual contendrá la configuración para ejecutar una barra de ejemplo.

Creo la carpeta Polybar dentro de .config<br>
`mkdir ~/.config/polybar`

Copio el archivo de ejemplo de configuración a la nueva carpeta.<br>
`cp /etc/polybar/config.ini ~/.config/polybar/`

Creo el archivo de ejecución.<br>
`touch ~/.config/polybar/launch.sh`

Agrego permisos de ejecución al archivo.<br>
`chmod +x ~/.config/polybar/launch.sh`

Abro el archivo launch.sh para decirle que ejecute la barra de ejemplo, voy a utilizar el código que se encuentra en la documentación.<br>
`nano ~/.config/polybar/launch.sh`

Código que va dentro de launch.sh:<br>

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log<br>
polybar example 2>&1 | tee -a /tmp/polybaremaple.log & disown

echo "Bars launched..."

Compruebo que funciona polybar con el siguiente comando.<br>
`polybar example`

### Polybar Themes

Polybar themes instala una gran cantidad de barras que pueden ser utilizadas. Es importante pasarse por la documentación ya que requiere una serie de dependencias para instalarlo. Además en la documentación se encuentran los pasos para hacer que se muestre la batería, control del brillo, iconos de aplicaciones en segundo plano, etc.

Primero instalo git para poder clonar el repositorio.<br>
`sudo dnf install git`

Clono el repositorio en la carpeta de descargas.<br>
`git clone --depth=1 https://github.com/adi1090x/polybar-themes.git`

Ingreso a la carpeta de polybar themes.<br>
`cd polybar-themes`

Asigno permisos al archivo setup.sh.<br>
`chmod +x setup.sh`

Ejecuto el archivo setup.sh y selecciono la opción 1 dentro de la terminal.<br>
`./setup.sh`

Por ultimo ejecuto una de las barras para validar que se instalaron correctamente.<br>
`bash ~/.config/polybar/launch.sh --shapes`

### i3 Gaps

Para instalar i3 Gaps en Fedora solo basta con ejecutar un comando. En mi caso ya tengo instalado i3 así que eso generará un conflicto. Así que para instalarlo tendré que agregar --allowerasing.<br>
`sudo dnf install i3-gaps --allowerasing`

### Picom

Picom se puede instalar simplemente con un comando y después solo es necesario generar el archivo de configuraciones que en este caso se encuentra en este mismo repositorio.<br>
`sudo dnf install picom`

Clono este repositorio en la carpeta de descargas.<br>
`git clone https://github.com/chrisramfon/Fedora-i3-Dotfiles.git`

Copio el archivo de configuración.<br>
`cp Fedora-i3-Dotfiles/picom/picom.conf ~/.config/`

### Rofi

Instalo rofi con el siguiente comando.<br>
`sudo dnf install rofi`

Genero un archivo de configuración.<br>
`mkdir -p ~/.config/rofi`

Le asigno el nuevo archivo a rofi.<br>
`rofi -dump-config > ~/.config/rofi/config.rasi`

### Lightdm webkit2 greeter

Este paquete permite modificar el display manager que viene por defecto en Fedora i3 ya que con el se pueden agregar temas para mejorar mucho el aspecto de lightdm. En principio debería ser sencillo instalarlo, pero en Fedora es algo complicado ya que el repositorio oficial de github no ha sido actualizado desde hace 2 años, es por eso que agrego el proceso que seguí para instalarlo. Realmente el procedimiento es simple, solo se descarga el .rpm y listo, lo complicado fue encontrar el correcto. El que a mi me funcionó fue el que se encuentra en el reposotorio llamado Raven, pero como no quiero agregar el repo, solo descargué el rpm desde <a href = "https://centos.pkgs.org/8/raven-x86_64/lightdm-webkit2-greeter-2.2.5-1.el8.x86_64.rpm.html"><b>aquí</b></a>. Para instalar las dependencias no necesité nada más que los repositorios que mencioné en la preparación.

Una vez descargado el archivo simplemente se instala con el siguiente comando.<br>
`sudo dnf install lightdm-webkit2-greeter-2.2.5-1.el8.x86_64.rpm`

## Probemas

### Wifi se deconecta de forma aleatoria

<a href = "https://ask.fedoraproject.org/t/how-to-keep-internet-connection-connected-without-interruption/15767/3"><b>Correr el comando de esta página para corregir el problema.</b></a>
