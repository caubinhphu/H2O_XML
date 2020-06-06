<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:key name="LoaiPhongKey" match="QLKS_H2O/LOAIPHONG" use="MA_LOAIPHONG"/>
    
    <xsl:template match="/">
        <div>
            <h1 class="text-center my-2">Danh Sách Phòng</h1>
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã Phòng</th>
                        <th>Mã Loại Phòng</th>
                        <th>Giá Phòng</th>
                        <th>Mã Trạng Thái</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="QLKS_H2O/PHONG">                    
                        <tr>
                            <td>
                                <xsl:value-of select="position()"/>
                            </td>
                            <td>
                                <input type="text">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="MAPHONG"/>
                                    </xsl:attribute>
                                </input>
                            </td>
                            <td>
                                <xsl:variable name="MaLP" select="MA_LOAIPHONG"/>
                                <select>
                                    <xsl:for-each select="//QLKS_H2O/LOAIPHONG">
                                        <option>
                                            <xsl:attribute name="value"><xsl:value-of select="MA_LOAIPHONG"/></xsl:attribute>
                                            <xsl:if test="MA_LOAIPHONG=$MaLP">
                                                <xsl:attribute name="selected">selected</xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="TEN_LOAIPHONG"/>
                                        </option>
                                    </xsl:for-each>
                                </select>
                            </td>
                            <td>
                                <input type="text" >
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="GIAPHONG"/>
                                    </xsl:attribute>
                                </input>
                            </td>
                            <td>
                                    <xsl:variable name="MaTT" select="MA_TRANGTHAI"/>
                                    <select>
                                        <xsl:for-each select="//QLKS_H2O/TRANGTHAI_PHONG">
                                            <option>
                                                <xsl:attribute name="value"><xsl:value-of select="MA_TRANGTHAI"/></xsl:attribute>
                                                <xsl:if test="MA_TRANGTHAI=$MaTT">
                                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                                </xsl:if>
                                                <xsl:value-of select="TEN_TRANGTHAI"/>
                                            </option>
                                        </xsl:for-each>
                                    </select>                            
                            </td>
                            <td>
                                <input type="submit" id="btn_sub" name="btn_sub" value="Cập Nhật" />
                            </td>
                            <td>
                                <input type="submit" id="btn_xoa" name="btn_xoa" value="Xóa" />
                            </td>
                            
                            </tr>
                            
                     </xsl:for-each>
                            <td>
                                <input type="submit" id="btn_them" name="btn_them" value="Thêm" />
                            </td>
                </tbody>
            </table>
            
        </div>
    </xsl:template>
</xsl:stylesheet>
