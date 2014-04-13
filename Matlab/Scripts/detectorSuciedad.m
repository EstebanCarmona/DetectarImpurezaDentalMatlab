%Directorio de entrada de los archivos con defectos
DIRENTRADA = '..\Imagenes\con defecto\';

%Elemento estructural
eleStructural = ones(3); 

files = dir(strcat(DIRENTRADA,'*.bmp'));
[f c] = size(files);

%For que recorre las imágenes y les aplica la funcion Bottom Hat
%Para pruebas solo se toman 5 imagenes
for i=1:5
    %disp(files(i).name);
    nomImg = strcat(DIRENTRADA,files(i).name);
    img = imread(nomImg);
    bhImagen = imbothat(img,eleStructural);
    figure,imagesc(bhImagen);
end

