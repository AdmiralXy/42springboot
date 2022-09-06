package com.admiralxy.cinema.mappers;

import com.admiralxy.cinema.entities.Image;
import liquibase.repackaged.org.apache.commons.lang3.ArrayUtils;
import org.mapstruct.Mapper;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

@Mapper(componentModel = "spring")
public interface ImagesMapper {

    default Image multipartFileToImage(MultipartFile value) {
        Image image = new Image();
        try {
            byte[] bytes = value.getBytes();

            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);

            BufferedImage bufferedImage = ImageIO.read(byteArrayInputStream);
            if (bufferedImage == null)
                throw new IOException();

            image.setData(ArrayUtils.toObject(bytes));

            byteArrayInputStream.close();

            return image;
        } catch (IOException ignored) {
            return null;
        }
    }

    default String map(Byte[] value) {
        byte[] bytes = ArrayUtils.toPrimitive(value);
        String encoded = Base64Utils.encodeToString(bytes);
        if (encoded.length() > 0)
            return "data:image/png;base64," + encoded;
        return "";
    }

}
