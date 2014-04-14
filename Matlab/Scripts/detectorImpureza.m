%Directorio de entrada de los archivos con defectos
DIRENTRADA = '..\Imagenes\con defecto\';
DIRENTRADA2 = '..\Imagenes\sin defecto\';
%Elemento estructural
eleStructural = ones(4); 
for ju=1:2
    if ju==1
        files = dir(strcat(DIRENTRADA,'*.bmp'));
    else 
        files = dir(strcat(DIRENTRADA2,'*.bmp'));
    end
    [f c] = size(files);

     contImg = 0;
    
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
            contImg = contImg + 1;
        end
    end
    %Calculamos el error 
    ErrorTotal = (contImg/f)*100; 
     if ju==1
        disp(strcat('El porcentaje de error en las imagenes con impurezas es: ',num2str((100-ErrorTotal)) , '%')); 
    else 
        disp(strcat('El porcentaje de error en las imagenes sin impurezas es: ',num2str(ErrorTotal) , '%'));
     end
end
