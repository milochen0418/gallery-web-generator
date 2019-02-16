# gallery-web-generator
Ubuntu 16.04: gallery-web-generator  node.js project with photo pre-processing by shell.  
When I develope this project , I use n to install node with version v10.13.0 

# Easy Usage
If you first time to clone this source code. and you go to the project folder.    
in this folder you can see ./package.json and all of script in the projects.   
You do the follow command and see follwoing result : 
$ tree -d ../downloads  
../downloads  
├── 可愛妹子  
├── 型男  
├── 妹子圖  
├── 小哥哥  
├── 小姐姐  
├── 小鮮肉  
├── 校花  
├── 正妹  
├── 潮男  
├── 瀟灑哥  
├── 熟女  
├── 猛男  
├── 美女  
├── 辣妹  
├── 靚仔  
├── 靚女  
└── 靚妹  
  
$ tree ../downloads/靚妹 | head -n 12  
../downloads/靚妹  
├── 100. 15199522962878irvozedjts.jpg  
├── 101. %e7%be%8e%e5%a5%b3(2).jpg  
├── 102. hqdefault.jpg  
├── 103. 069c27d86a5c60e21ac48029bbed8094.jpg  
├── 104. 704280039341899-450x671.jpg  
├── 105. 15-58.jpg  
├── 1. 0522-00286-004v1.jpg  
├── 106. 21111288988650_161.jpg  
├── 107. 7286927-big8.jpg  
├── 108. 5acf0d81ne663a5d0.jpg  
├── 109. 08ed6p37r.jpg  
  
In the ../downloads,  
each photo filename in subdir(e.g 靚妹) is start from number and there is a space to seperate the filename.  
Our script only support to process this filename format now.   
  
When you understand this format limit. then you can call  
$ ./gallery_procedure.sh 8808 ../downloads 校花  
Then everything will process ready. after finish,  
To opoen browser with the address http://yourhost:8808/ can show 校花 gallery webpage  

You can also call  
$ ./gallery_procedure.sh 8812 ../downloads   
Then everything will process ready. after finish,   
To opoen browser with the address http://yourhost:8808/ can   
show all correct pictures of ../downlaods into a gallery webpage.   



# development note
## node version
v 10.13.0  
## pre-install package  
$ apt-get install imagemagick   
$ apt-get install graphicsmagick    
$ apt-get install graphicsmagick-imagemagick-compat  
$ apt-get install tree  
$ npm install --save epg-prep   
$ npm install --save express   
$ npm install --save express-photo-gallery  
$ npm install --save minimist  
## preprocess fot photos from ./raw_photos to ./photos
some process will copy all photos of speicfic one gallery  into ./raw_photos  
$ ./rename_process.sh ./raw_photos ./photos/校花    
$ ./identify_process.sh ./photos/校花  
$ ./clean_gif_process.sh ./photos/校花  

## make previews and thumbs
$ ./node_modules/.bin/epg-prep ./photos/校花    

## execute web
$ node ./app.js --port=8181 --subdir=校花    

## look in browser
Just open http://yourhost:8181/    
Then you can see 校花 gallery   
You have idea to know how to show one specific gallery   

## create_a_gallery.sh : combine rename_process.sh, identify_process.sh and clean_gif_process.sh
### rename_process.sh
 BASH is hard to process very complicated file name, so rename_process.sh convert it in simple name   
### identify_process.sh
 With some kind of imagemagick .deb package, you can check image file correct of broken  
### clean_gif_process.sh 
 Some gif file will be allowed by identify process but our gallery program cannot convert it to previews and thumbs well.  
 So, we need to clean the .gif file so that epg-preg command can make photos into previews style and thumbs style  
### epg-prep
 epg-prep is installed by npm package.  
 It's help you to convert photos into previews and thumbs.   
 With the previews and thumbs, your web source code can show it on your page. So that your webpage will have a good user experience.  

### Combine to create_a_gallery.sh
 $ ./create_a_gallery.sh ../downloads/校花 ./photos/校花  
 The script will copy all photos in ../downloads/校花, and then convert into gallery that stored in ./photo/校花.  
 your webpage the use this gallery folder directly and show on web with no problem   

 PS: The ../downloads/校花 may store a lot of pictures in same folder. And the picture filename is with numbers in the filename head.   

 There are more information of create_a_gallery.sh  
 The four script is too detail for people to use until you want to help to debug or improve our script system.  
 So just let the complcated thing become one command.   

## create_a_galleries_set.sh  
When you download a lot of different image with different types and store them into different folder by each type,   
then you need to extend create_a_gallery.sh into create_a_galleries_set.sh to process it in one time.  
so taht a lot of gallery is made and there is also a ALL gallery to store all picture.  

After you generating these galleries into same folder, then you can use your web to open gallery for   
some speicfic gallery that you want to show.   

## gallery_procedure.sh
When first time to clone this git source code. just call   
If you have some source folder that ready to save different kind of pictures. then just call  
./gallery_procedure.sh and all of thing will ready and web server will open after everthing ready.  

