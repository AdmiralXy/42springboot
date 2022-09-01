package com.admiralxy.cinema.mappers;

import com.admiralxy.cinema.entities.Image;
import liquibase.repackaged.org.apache.commons.lang3.ArrayUtils;
import org.mapstruct.Mapper;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;

@Mapper(componentModel = "spring")
public interface ImagesMapper {

    default Image multipartFileToImage(MultipartFile value) {
        Image image = new Image();
        try {
            image.setData(ArrayUtils.toObject(value.getBytes()));
        } catch (IOException ignored) {
            image.setData(null);
        }
        return image;
    }

    default String map(Byte[] value) {
        byte[] bytes = ArrayUtils.toPrimitive(value);
        String encoded = Base64Utils.encodeToString(bytes);
        if (encoded.length() > 0)
            return "data:image/png;base64," + encoded;
        return "";
    }

}
