%Directorio de entrada de los archivos con defectos
DIRENTRADA = '..\Imagenes\con defecto\';


%Elemento estructural
eleStructural = ones(3); 

files = dir(strcat(DIRENTRADA,'*.bmp'));
[f c] = size(files);

%For que recorre las imágenes y les aplica la funcion Bottom Hat
%Para pruebas solo se toman 5 imagenes
for i=1:1
    %disp(files(i).name);
    nomImg = strcat(DIRENTRADA,files(i).name);
    img = imread(nomImg);
    %Convierte la imagen de RGB a escala de grises
    img = ConvertToGray(img);
    %Corta la imagen para eliminar, en lo posible, el fondo.
    img = cutImage(img);
    %Aplicamos el filtro Bottom Hat
    bhImagen = imbothat(img,eleStructural);
    figure,imagesc(bhImagen); 
    bhImagen = ConvertToGray(bhImagen);
    %Restar la imagen defecto con la imagen resultante de la operacion
    %Bottom-Hat 
    %resImage = bhImagen - img;
    %figure,imagesc(resImage);
end

