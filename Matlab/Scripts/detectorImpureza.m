%Directorio de entrada de los archivos con defectos
DIRENTRADA = '..\Imagenes\con defecto\';
DIRENTRADA2 = '..\Imagenes\sin defecto\';
%Directorios de la salida de los archivos resultantes.
DIRDEFECTO = '..\Imagenes\Resultados\Defecto\'; 
DIRSINDEFECTO = '..\Imagenes\Resultados\SinDefecto\';
%Elemento estructural
eleStructural = ones(3); 

files = dir(strcat(DIRENTRADA,'*.bmp'));
[f c] = size(files);

%Creamos la carpeta que almacena el imperfecto del diente
mkdir(DIRDEFECTO);
%Creamos la carpeta que almacena el resultado de quitarle el imperfecto al
%diente defectuoso. 
mkdir(DIRSINDEFECTO);

%For que recorre las imágenes y les aplica la funcion Bottom Hat
%Para pruebas solo se toman 5 imagenes
for i=1:1
    %disp(files(i).name);
    nomImg = strcat(DIRENTRADA,files(i).name);
    img = imread(nomImg);
    bhImagen = imbothat(img,eleStructural);
    figure,imagesc(bhImagen);
    %Guardamos la imagen resultante.
    imwrite(bhImagen, strcat(DIRDEFECTO,files(i).name));
    %Convertir a escala de grises
    img = ConvertToGray(img); 
    bhImagen = ConvertToGray(bhImagen);
    %Restar la imagen defecto con la imagen resultante de la operacion
    %Bottom-Hat 
    resImage = img - bhImagen;
    figure,imagesc(resImage);
end

