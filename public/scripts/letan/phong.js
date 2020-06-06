const xhr = new XMLHttpRequest();

let xml = null;

xhr.open('get', '/data/QLKS_H2O.xml', false);

xhr.onload = function () {
  xml = this.responseXML;

  const idPhong = new URLSearchParams(location.search).get('id');
  
  const phong = [...xml.getElementsByTagName('PHONG')]
    .find(p => p.querySelector('MAPHONG').innerHTML === idPhong);

    if (phong) {
        document.getElementById('maphong').innerHTML = phong.querySelector('MAPHONG').innerHTML;

        const maLoaiPhong = phong.querySelector('MA_LOAIPHONG').innerHTML;
        const loaiPhong = [...xml.getElementsByTagName('LOAIPHONG')]
            .find(lp => lp.querySelector('MA_LOAIPHONG').innerHTML === maLoaiPhong);
        
        if (loaiPhong) {
            document.getElementById('loaiphong').innerHTML = loaiPhong.querySelector('TEN_LOAIPHONG').innerHTML;
        
            const vatTus = [...xml.getElementsByTagName('VATTU_LOAIPHONG')]
                .filter(item => item.querySelector('MA_LOAIPHONG').innerHTML === maLoaiPhong);
            
            
            vatTus.forEach((item, index) => {
                const vatTu = [...xml.getElementsByTagName('VATTU')]
                    .find(vt => vt.querySelector('MA_VATTU').innerHTML === item.querySelector('MA_VATTU').innerHTML);
                if (vatTu) {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `<td>${index + 1}</td>
                        <td>${vatTu.querySelector('TEN_VATTU').innerHTML}</td>
                        <td>${item.querySelector('SOLUONG').innerHTML}</td>`;

                    document.getElementById('vattuBody').appendChild(tr);
                }
            })
        }

        const ctThuePhongs = [...xml.getElementsByTagName('CHITIET_THUEPHONG')];

        const phieuThuePhong = [...xml.getElementsByTagName('PHIEU_THUEPHONG')]
            .filter(phieu => phieu.getAttribute("DATRAPHONG") === "0")
            .map(phieu => {
                phieu.chiTiet = ctThuePhongs
                    .filter (
                        ct => ct.querySelector('SO_PHIEU').innerHTML === phieu.querySelector('SO_PHIEU').innerHTML &&
                            ct.querySelector('MAPHONG').innerHTML === idPhong
                    );
                return phieu;
            }).find(phieu => phieu.chiTiet.length > 0);

        if (phieuThuePhong) {
            console.log(phieuThuePhong)
            document.getElementById('phieuthue').innerHTML =
                `<hr>
                <div class="text-center"><h5>PHIEU THUE PHONG</h5></div>
                <div>SO PHIEU: ${phieuThuePhong.querySelector('SO_PHIEU').innerHTML}</div>
                <div>MA KHACH: ${phieuThuePhong.querySelector('MAKHACH').innerHTML}</div>
                <div>MA NHÂN VIÊN: ${phieuThuePhong.querySelector('MA_NHANVIEN').innerHTML}</div>
                <div>NGÀY LẬP PHIẾU: ${phieuThuePhong.querySelector('NGAYLAP_PHIEU').innerHTML}</div>
                <div>NGÀY ĐẾN: ${phieuThuePhong.querySelector('NGAYDEN').innerHTML}</div>
                <div>NGÀY ĐI: ${phieuThuePhong.querySelector('NGAYDI').innerHTML}</div>
                `;
        }
        
        
        

    }
};

xhr.send(null);
