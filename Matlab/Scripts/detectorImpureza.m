%Directorio de entrada de los archivos con defectos
DIRENTRADA = '..\Imagenes\con defecto\';
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
for i=1:5
    %disp(files(i).name);
    nomImg = strcat(DIRENTRADA,files(i).name);
    img = imread(nomImg);
    %Convierte la imagen de RGB a escala de grises
    img = convertToGray(img);
    %Corta la imagen para eliminar, en lo posible, el fondo.
    img = cutImage(img);
    %Aplicamos el filtro Bottom Hat
    bhImagen = imbothat(img,eleStructural);
    figure,imagesc(bhImagen);
    %Guardamos la imagen resultante.
    imwrite(img_rgb, strcat(DIRDEFECTO,nombre));
end

