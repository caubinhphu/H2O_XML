<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <div>
            <h1 class="text-center my-2">Danh Sách Dịch Vụ</h1>
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã Dịch Vụ</th>
                        <th>Tên Dịch Vụ</th>
                        <th>Giá Dịch Vụ</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <xsl:variable name="stt" select="1"/>
                    <xsl:for-each select="QLKS_H2O/DICHVU">                    
                            <tr>
                                <td>
                                    <xsl:value-of select="$stt"/>
                                </td>
                                <td>
                                    <xsl:value-of select="MA_DICHVU"/>
                                </td>
                                <td>
                                    <xsl:value-of select="TEN_DICHVU"/>
                                </td>
                                <td>
                                    <xsl:value-of select="GIA_DICHVU"/>
                                </td>
                                
                            </tr>
                        
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>
