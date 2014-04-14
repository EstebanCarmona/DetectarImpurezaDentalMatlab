%Directorio de entrada de los archivos con defectos
DIRENTRADA = '..\Imagenes\con defecto\';
<<<<<<< HEAD

=======
DIRENTRADA2 = '..\Imagenes\sin defecto\';

%Directorios de la salida de los archivos resultantes.
DIRDEFECTO = '..\Imagenes\Resultados\Defecto\'; 

%Creamos la carpeta que almacena el imperfecto del diente
mkdir(DIRDEFECTO);
>>>>>>> 82461a907ee9843ceee11e56836fe131190a85aa

%Elemento estructural
eleStructural = ones(4); 

for ju=1:2
    if ju==1
        files = dir(strcat(DIRENTRADA,'*.bmp'));
    else 
        files = dir(strcat(DIRENTRADA2,'*.bmp'));
    end
    [f c] = size(files);

<<<<<<< HEAD
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
=======
    %For que recorre las imágenes y les aplica la funcion Bottom Hat
    for i=1:f
        if ju==1
            nomImg = strcat(DIRENTRADA,files(i).name);
        else
            nomImg = strcat(DIRENTRADA2,files(i).name);
        end
        img = imread(nomImg);
        %Corta la imagen para eliminar, en lo posible, el fondo.
        img = cutImage(img);
        %Aplicamos el filtro Bottom Hat
        bhImagen = imbothat(img,eleStructural);

        [ff cc] = size(bhImagen);
        cont = 0;
        for j=1:ff
            for k=1:cc
                if bhImagen(j,k,1) >= 22
                    cont = cont + 1;
                end            
            end
        end
        
        if cont >= 1
            %disp (strcat(files(i).name,' -- ',int2str(cont)));
            %imwrite(bhImagen, strcat(DIRDEFECTO,files(i).name));
        end
    end
>>>>>>> 82461a907ee9843ceee11e56836fe131190a85aa

end
