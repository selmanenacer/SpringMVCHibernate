package fr.uvsq.spring.util;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.imageio.ImageIO;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.usertype.UserType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ImageBlobUserType implements UserType {

    private static final Logger logger = LoggerFactory.getLogger(ImageBlobUserType.class);

    @Override
    public Object assemble(final Serializable pCached, final Object pOwner) throws HibernateException {
        return pCached;
    }

    @Override
    public Object deepCopy(final Object pValue) throws HibernateException {
        return pValue;
    }

    @Override
    public Serializable disassemble(final Object pValue) throws HibernateException {
        return (Serializable) pValue;
    }

    @Override
    public boolean equals(final Object pObject0, final Object pObject1) throws HibernateException {
        if (pObject0 == pObject1) {
            return true;
        }
        if (null == pObject0 || null == pObject1) {
            return false;
        }
        return pObject0.equals(pObject1);
    }

    @Override
    public int hashCode(final Object pObject) throws HibernateException {
        return pObject.hashCode();
    }

    @Override
    public boolean isMutable() {
        return false;
    }

    @Override
    public Object nullSafeGet(final ResultSet pResultSet, final String[] pNames,
            final SessionImplementor pSession, final Object pOwner) throws HibernateException,
            SQLException {

        logger.info("Lecture dans la colonne "+pNames[0]);
        final InputStream lInputStream = pResultSet.getBinaryStream(pNames[0]);
        Image lImage = null;
        try {
            lImage = ImageIO.read(lInputStream);
        }
        catch (final IOException lIOException) {
        	logger.error(lIOException.getLocalizedMessage(), lIOException);
        }
        return lImage;
    }

    @Override
    public void nullSafeSet(final PreparedStatement pStatement, final Object pValue,
            final int pIndex, final SessionImplementor pSession) throws HibernateException, SQLException {

    	logger.info("Enregistrement à l'index "+pIndex);
        if (pValue == null) {
            pStatement.setNull(pIndex, sqlTypes()[0]);
        }
        else {
            final java.awt.Image lImage = (java.awt.Image) pValue;
            final ByteArrayOutputStream lBos = new ByteArrayOutputStream();
            try {
                ImageIO.write((RenderedImage) lImage, "png", lBos);
            }
            catch (final IOException lIOException) {
            	logger.error(lIOException.getLocalizedMessage(), lIOException);
            }
            final ByteArrayInputStream lBis = new ByteArrayInputStream(lBos.toByteArray());
            pStatement.setBinaryStream(pIndex, lBis, lBos.toByteArray().length);
        }
    }

    @Override
    public Object replace(final Object pOriginal, final Object pTarget, final Object pOwner) throws HibernateException {
        return pOriginal;
    }

    @Override
    public Class<?> returnedClass() {
        return java.awt.Image.class;
    }

    @Override
    public int[] sqlTypes() {
        return new int[] {Types.LONGVARBINARY};
    }
}