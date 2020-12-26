from django.shortcuts import redirect, render
from django.http import HttpResponse, response
import MySQLdb
from django.db import connection

from .forms import loginForm
from django.views import View
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from .decorators import allowed_users

current_term = '201'

# Create your views here.

def home(request):
    return render(request, 'home/index.html')

class loginUser(View):
    def get(self,request):
        lF =  loginForm
        return render(request, 'home/login.html',{'lF':lF})

    def post(self,request):
        username  = request.POST['username']
        pasword = request.POST['password']

        user = authenticate(request, username=username, password=pasword)
        if user is not None:
            login(request, user)
            return redirect('home:total')
        else:
            lF =  loginForm
            return render(request, 'home/login.html',{'lF':lF})

@login_required
@allowed_users(['sinhvien','giangvien','pdt','khoa'])
def total(request):
    return render(request, 'home/totalPage.html')

@login_required
@allowed_users(['sinhvien','giangvien','pdt','khoa'])
def logoutUser(request):
    logout(request)
    return render(request, 'home/index.html')

@login_required
@allowed_users(['sinhvien','khoa','pdt'])
def dkmh(request):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    cursor = db.cursor()
    op = 'SELECT hoc_ky, l.ma_mon_hoc,ten_mon_hoc,so_tin_chi FROM lop l join mon_hoc m on l.ma_mon_hoc = m.ma_mon_hoc where hoc_ky ='+ current_term +' group by l.ma_mon_hoc'
    cursor.execute(op)
    columns = [col[0] for col in cursor.description]
    classes = [dict(zip(columns, row)) for row in cursor.fetchall()]

    cursor1 = db.cursor()
    op = 'SELECT d.MSSV, l.ma_lop_hoc, hoc_ky, sum(so_tin_chi) Tong_tin_chi FROM dang_ky d join sinh_vien s on d.MSSV = s.MSSV join lop l on d.id_lop = l.idlop join mon_hoc m on m.ma_mon_hoc = l.ma_mon_hoc where hoc_ky = '+str(current_term)+' GROUP BY MSSV'   
    cursor1.execute(op)
    columns = [col[0] for col in cursor1.description]
    dangky = [dict(zip(columns, row)) for row in cursor1.fetchall()]

    cursor2 = db.cursor()
    op = 'SELECT s.MSSV,s.Username,ho, ten FROM sinh_vien s join nguoi_dung n on s.Username = n.username'   
    cursor2.execute(op)
    columns = [col[0] for col in cursor2.description]
    lsvUsername = [dict(zip(columns, row)) for row in cursor2.fetchall()]

    db.close()
    return render(request, 'home/dkmh.html',{'current_term':current_term,'classes': classes, 'dangky': dangky,'lsinhvien':lsvUsername})

@login_required
@allowed_users(['sinhvien'])
def dangky(request, mamh):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    cursor = db.cursor()
    op = 'SELECT hoc_ky, l.ma_mon_hoc, ten_mon_hoc, so_tin_chi FROM lop l join mon_hoc m on l.ma_mon_hoc = m.ma_mon_hoc where m.ma_mon_hoc = \''+ mamh + '\''
    cursor.execute(op)
    columns = [col[0] for col in cursor.description]
    courses = [dict(zip(columns, row)) for row in cursor.fetchall()][0]


    cursor0 = db.cursor()
    op = 'SELECT idlop, ma_lop_hoc,hoc_ky, l.ma_mon_hoc,ten_mon_hoc,so_tin_chi FROM lop l join mon_hoc m on l.ma_mon_hoc = m.ma_mon_hoc where hoc_ky ='+ current_term + ' and m.ma_mon_hoc=\''+ mamh + '\''
    cursor0.execute(op)
    columns = [col[0] for col in cursor0.description]
    classes = [dict(zip(columns, row)) for row in cursor0.fetchall()]

    cursor1 = db.cursor()
    op = 'SELECT d.MSSV, l.ma_lop_hoc,l.ma_mon_hoc, hoc_ky, sum(so_tin_chi) Tong_tin_chi FROM dang_ky d join sinh_vien s on d.MSSV = s.MSSV join lop l on d.id_lop = l.idlop join mon_hoc m on m.ma_mon_hoc = l.ma_mon_hoc where hoc_ky = '+current_term+' GROUP BY MSSV'   
    cursor1.execute(op)
    columns = [col[0] for col in cursor1.description]
    dangky = [dict(zip(columns, row)) for row in cursor1.fetchall()]

    cursor2 = db.cursor()
    op = 'SELECT s.MSSV,s.Username,ho, ten FROM sinh_vien s join nguoi_dung n on s.Username = n.username'   
    cursor2.execute(op)
    columns = [col[0] for col in cursor2.description]
    lsvUsername = [dict(zip(columns, row)) for row in cursor2.fetchall()]
    
    
    if request.method == 'POST':
        idlop = request.POST.get('malop','')
        
        cursor3 = db.cursor()
        us = request.user.username
        op = 'SELECT s.MSSV FROM sinh_vien s join nguoi_dung n on s.Username = n.username where s.username= \''+ str(us)+ '\''
        cursor3.execute(op)
        sv = cursor3.fetchall()
        for x in sv: s = x
        for x in s: ss = x

        cursor6 = db.cursor()
        op = 'SELECT * FROM trang_thai_hoc_tap'   
        cursor6.execute(op)
        columns = [col[0] for col in cursor6.description]
        trangthai = [dict(zip(columns, row)) for row in cursor6.fetchall()]

        for x in trangthai:
            if x["MSSV"] == ss and x["hoc_ky"] == int(current_term):
                tt = x["trang_thai"]

        tong_tin_chi = 0
        
        for y in dangky:
            if y["MSSV"] == ss:
                tong_tin_chi = y["Tong_tin_chi"]

        dadangky=False
        cursor5 = db.cursor()
        cursor5.execute('SELECT d.MSSV, l.ma_mon_hoc, hoc_ky FROM dang_ky d join lop l on d.id_lop = l.idlop where hoc_ky = '+current_term+' '   )
        columns = [col[0] for col in cursor5.description]
        dsdangky = [dict(zip(columns, row)) for row in cursor5.fetchall()]
        for y in dsdangky:
            if y["MSSV"] == ss and y["ma_mon_hoc"] == mamh and y["hoc_ky"] == int(current_term):
                dadangky = True

        cursor4 = db.cursor()
        cursor4.execute('SELECT count(*) siso FROM dang_ky where id_lop='+str(idlop)+' group by id_lop')
        siso = cursor4.fetchall()
        xsiso = 0
        for x in siso: 
            for y in x: xsiso = y
        if xsiso == None: xsiso = 0

        if xsiso < 60 and tong_tin_chi + courses["so_tin_chi"] <= 18 and not dadangky and tt =='Dang hoc':
            with connection.cursor() as c:
                c.execute('INSERT INTO dang_ky value('+str(ss)+',' +str(idlop) + ')')
            return redirect('/dkmh/')
        else:
            return redirect('/dkerror/')
    context = {
        'courses': courses,
        'lsinhvien': lsvUsername,
        'dangky': dangky,
        'classes':classes,
    }
    return render(request,'home/dkmonhoc.html',context)

@login_required
@allowed_users(['sinhvien'])
def dkerror(request):
    return render(request,'home/dk_error.html')


@login_required
@allowed_users(['giangvien','pdt','khoa'])
def qlgiangday(request):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    cursor = db.cursor()
    cursor.execute('SELECT * FROM ns_khoa_quan_ly ns join nhan_vien n on n.MSNV=ns.MSNV')
    columns = [col[0] for col in cursor.description]
    dskhoa = [dict(zip(columns, row)) for row in cursor.fetchall()]
    
    context = {
        'dskhoa':dskhoa,
    }
    return render(request,'home/quanlygiangday.html',context)

@login_required
@allowed_users(['pdt','khoa'])
def qlmonhoc(request,khoa):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    
    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM khoa where ma_khoa =\''+ str(khoa) + '\'')
    columns = [col[0] for col in cursor.description]
    dskhoa = [dict(zip(columns, row)) for row in cursor.fetchall()][0]

    cursor1 = db.cursor()
    cursor1.execute( 'SELECT * FROM mon_hoc where ma_khoa =\''+ str(khoa) + '\'')
    columns = [col[0] for col in cursor1.description]
    monhoc = [dict(zip(columns, row)) for row in cursor1.fetchall()]


    cursor2 = db.cursor()
    cursor2.execute( 'SELECT g.MSNV, MSNV_quan_ly, ma_khoa, Ho,Ten from giang_vien g join ns_khoa_quan_ly ns on MSNV_quan_ly=ns.MSNV join nhan_vien nv on g.MSNV=nv.MSNV join nguoi_dung nd on nd.Username=nv.Username  where ma_khoa=\''+ str(khoa) + '\'' )
    columns = [col[0] for col in cursor2.description]
    gv = [dict(zip(columns, row)) for row in cursor2.fetchall()]

    context={
        "khoa":dskhoa,
        "monhoc":monhoc,
        'gv':gv,
    }
    return render(request,'home/qlmonhoc.html',context)

@login_required
@allowed_users(['khoa'])
def updateMonhoc(request,khoa,monhoc):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    
    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM khoa where ma_khoa =\''+ str(khoa) + '\'')
    columns = [col[0] for col in cursor.description]
    dskhoa = [dict(zip(columns, row)) for row in cursor.fetchall()][0]

    cursor1 = db.cursor()
    cursor1.execute( 'SELECT * FROM mon_hoc where ma_khoa =\''+ str(khoa) + '\' and ma_mon_hoc=\''+str(monhoc)+'\'')
    columns = [col[0] for col in cursor1.description]
    monhoc = [dict(zip(columns, row)) for row in cursor1.fetchall()][0]


    cursor2 = db.cursor()
    cursor2.execute( 'SELECT g.MSNV, MSNV_quan_ly, ma_khoa, Ho,Ten from giang_vien g join ns_khoa_quan_ly ns on MSNV_quan_ly=ns.MSNV join nhan_vien nv on g.MSNV=nv.MSNV join nguoi_dung nd on nd.Username=nv.Username  where ma_khoa=\''+ str(khoa) + '\'' )
    columns = [col[0] for col in cursor2.description]
    gv = [dict(zip(columns, row)) for row in cursor2.fetchall()]

    if request.method == 'POST':
        ten_mon_hoc = request.POST.get('ten_mon_hoc','')
        so_tin_chi = request.POST.get('so_tin_chi','')
        gvpt = request.POST.get('gvphutrach','')
        if ten_mon_hoc != monhoc["ten_mon_hoc"]:
            with connection.cursor() as c:
                c.execute('UPDATE mon_hoc SET ten_mon_hoc= \''+str(ten_mon_hoc)+'\' where ma_mon_hoc=\''+str(monhoc["ma_mon_hoc"])+'\'')
        if so_tin_chi != monhoc["so_tin_chi"] and int(so_tin_chi) <= 3 and int(so_tin_chi) >=0:
            with connection.cursor() as c:
                c.execute('UPDATE mon_hoc SET so_tin_chi= '+str(so_tin_chi)+' where ma_mon_hoc=\''+str(monhoc["ma_mon_hoc"])+'\'')
        
        cursor4 = db.cursor()
        cursor4.execute( 'SELECT * from chi_dinh join lop on id_lop=idlop where hoc_ky='+ current_term )
        columns = [col[0] for col in cursor4.description]
        chidinh = [dict(zip(columns, row)) for row in cursor4.fetchall()]
        
        cursor3 = db.cursor()
        cursor3.execute( 'SELECT idlop FROM lop l join mon_hoc m on l.ma_mon_hoc=m.ma_mon_hoc where ma_khoa= \''+ str(khoa) + '\' and hoc_ky='+current_term +' and l.ma_mon_hoc=\''+str(monhoc["ma_mon_hoc"])+'\'')
        loppt = cursor3.fetchall()

        for c in chidinh:
            for y in loppt:
                for x in y:
                    if c["MSNV"]==gvpt and c["id_lop"]==x:
                        return redirect('/qlmonhoc/'+str(khoa)+'/')
        for c in chidinh:
            for y in loppt:
                for x in y:
                    if c["id_lop"]==x:
                        for j in loppt:
                            for i in j:
                                with connection.cursor() as c:
                                    c.execute('UPDATE chi_dinh set MSNV=\''+str(gvpt)+'\' where id_lop='+str(i))
                        return redirect('/qlmonhoc/'+str(khoa)+'/')
        for y in loppt:
            for x in y:
                with connection.cursor() as c:
                    c.execute('INSERT INTO chi_dinh (MSNV,id_lop) value(\''+str(gvpt)+'\','+str(x)+')')
        return redirect('/qlmonhoc/'+str(khoa)+'/')
            
    context={
        "khoa":dskhoa,
        "monhoc":monhoc,
        'gv':gv,
    }
    return render(request,'home/updateMonhoc.html',context)

@login_required
@allowed_users(['pdt','khoa'])
def qllophoc(request,khoa):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    dskhoa=[]
    if khoa!='000':
        cursor = db.cursor()
        cursor.execute( 'SELECT * FROM khoa where ma_khoa =\''+ str(khoa) + '\'')
        columns = [col[0] for col in cursor.description]
        dskhoa = [dict(zip(columns, row)) for row in cursor.fetchall()][0]

        cursor1 = db.cursor()
        cursor1.execute( 'SELECT * FROM mon_hoc join lop on lop.ma_mon_hoc=mon_hoc.ma_mon_hoc where ma_khoa =\''+ str(khoa) + '\' and hoc_ky='+current_term)
        columns = [col[0] for col in cursor1.description]
        lophoc = [dict(zip(columns, row)) for row in cursor1.fetchall()]
    
        cursor2 = db.cursor()
        cursor2.execute( 'SELECT g.MSNV, MSNV_quan_ly, ma_khoa, Ho,Ten from giang_vien g join ns_khoa_quan_ly ns on MSNV_quan_ly=ns.MSNV join nhan_vien nv on g.MSNV=nv.MSNV join nguoi_dung nd on nd.Username=nv.Username  where ma_khoa=\''+ str(khoa) + '\'' )
        columns = [col[0] for col in cursor2.description]
        gv = [dict(zip(columns, row)) for row in cursor2.fetchall()]

        
    else:
        cursor1 = db.cursor()
        cursor1.execute( 'SELECT * FROM mon_hoc join lop on lop.ma_mon_hoc=mon_hoc.ma_mon_hoc  and hoc_ky='+current_term+' order by lop.ma_mon_hoc')
        columns = [col[0] for col in cursor1.description]
        lophoc = [dict(zip(columns, row)) for row in cursor1.fetchall()]

        cursor2 = db.cursor()
        cursor2.execute( 'SELECT g.MSNV, MSNV_quan_ly, ma_khoa, Ho,Ten from giang_vien g join ns_khoa_quan_ly ns on MSNV_quan_ly=ns.MSNV join nhan_vien nv on g.MSNV=nv.MSNV join nguoi_dung nd on nd.Username=nv.Username' )
        columns = [col[0] for col in cursor2.description]
        gv = [dict(zip(columns, row)) for row in cursor2.fetchall()]

    cursor3 = db.cursor()
    cursor3.execute( 'SELECT idlop,count(MSSV)siso FROM lop join dang_ky on idlop=id_lop group by idlop order by lop.ma_mon_hoc' )
    columns = [col[0] for col in cursor3.description]
    siso = [dict(zip(columns, row)) for row in cursor3.fetchall()]
    

    context={
        "term":current_term,
        "khoa":dskhoa,
        "lophoc":lophoc,
        'gv':gv,
        'siso':siso,
    }
    return render(request,'home/qllophoc.html',context)

@login_required
@allowed_users(['khoa','pdt'])
def updateLophoc(request,khoa,lop):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    
    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM khoa where ma_khoa =\''+ str(khoa) + '\'')
    columns = [col[0] for col in cursor.description]
    dskhoa = [dict(zip(columns, row)) for row in cursor.fetchall()][0]

    cursor1 = db.cursor()
    cursor1.execute( 'SELECT * FROM lop join mon_hoc on lop.ma_mon_hoc=mon_hoc.ma_mon_hoc where ma_khoa =\''+ str(khoa) + '\' and idlop=\''+str(lop)+'\'')
    columns = [col[0] for col in cursor1.description]
    dslop = [dict(zip(columns, row)) for row in cursor1.fetchall()][0]

    cursor2 = db.cursor()
    cursor2.execute( 'SELECT g.MSNV, MSNV_quan_ly, ma_khoa, Ho,Ten from giang_vien g join ns_khoa_quan_ly ns on MSNV_quan_ly=ns.MSNV join nhan_vien nv on g.MSNV=nv.MSNV join nguoi_dung nd on nd.Username=nv.Username  where ma_khoa=\''+ str(khoa) + '\'' )
    columns = [col[0] for col in cursor2.description]
    gv = [dict(zip(columns, row)) for row in cursor2.fetchall()]

    if request.method == 'POST':
        gvpt = request.POST.get('gvphutrach','')
        with connection.cursor() as c:
            c.execute('INSERT INTO ghi_diem (MSNV,id_lop) value(\''+str(gvpt)+'\','+str(lop)+')')
        return redirect('/qllophoc/'+str(khoa)+'/')
    context={
        "khoa":dskhoa,
        "lop":dslop,
        'gv':gv,
    }
    return render(request,'home/updatelophoc.html',context)

@login_required
@allowed_users(['khoa','pdt'])
def deleteLophoc(request,khoa,lop):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    
    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM khoa where ma_khoa =\''+ str(khoa) + '\'')
    columns = [col[0] for col in cursor.description]
    dskhoa = [dict(zip(columns, row)) for row in cursor.fetchall()][0]

    cursor1 = db.cursor()
    cursor1.execute( 'SELECT * FROM lop join mon_hoc on lop.ma_mon_hoc=mon_hoc.ma_mon_hoc where ma_khoa =\''+ str(khoa) + '\' and idlop=\''+str(lop)+'\'')
    columns = [col[0] for col in cursor1.description]
    dslop = [dict(zip(columns, row)) for row in cursor1.fetchall()][0]

    cursor2 = db.cursor()
    cursor2.execute( 'SELECT g.MSNV, MSNV_quan_ly, ma_khoa, Ho,Ten from giang_vien g join ns_khoa_quan_ly ns on MSNV_quan_ly=ns.MSNV join nhan_vien nv on g.MSNV=nv.MSNV join nguoi_dung nd on nd.Username=nv.Username  where ma_khoa=\''+ str(khoa) + '\'' )
    columns = [col[0] for col in cursor2.description]
    gv = [dict(zip(columns, row)) for row in cursor2.fetchall()]

    if request.method == 'POST':
        with connection.cursor() as c:
            c.execute('DELETE FROM lop where idlop= \''+str(lop)+'\'')
        return redirect('/qllophoc/'+str(khoa)+'/')
    context={
        "ma_khoa":khoa,
        "khoa":dskhoa,
        "lop":dslop,
        'gv':gv,
    }
    return render(request,'home/deletelophoc.html',context)

@login_required
@allowed_users(['khoa'])
def newLophoc(request,khoa):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    
    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM khoa where ma_khoa =\''+ str(khoa) + '\'')
    columns = [col[0] for col in cursor.description]
    dskhoa = [dict(zip(columns, row)) for row in cursor.fetchall()][0]

    cursor2 = db.cursor()
    cursor2.execute( 'SELECT g.MSNV, MSNV_quan_ly, ma_khoa, Ho,Ten from giang_vien g join ns_khoa_quan_ly ns on MSNV_quan_ly=ns.MSNV join nhan_vien nv on g.MSNV=nv.MSNV join nguoi_dung nd on nd.Username=nv.Username  where ma_khoa=\''+ str(khoa) + '\'' )
    columns = [col[0] for col in cursor2.description]
    gv = [dict(zip(columns, row)) for row in cursor2.fetchall()]

    cursor3 = db.cursor()
    cursor3.execute( 'SELECT * FROM mon_hoc where ma_khoa =\''+ str(khoa) + '\' ')
    columns = [col[0] for col in cursor3.description]
    monhoc = [dict(zip(columns, row)) for row in cursor3.fetchall()]


    if request.method == 'POST':
        ma_lop=request.POST.get('ma_lop_hoc','')
        ma_mh=request.POST.get('ma_mh','')
        
        cursor4 = db.cursor()
        cursor4.execute( 'SELECT * FROM lop natural join mon_hoc where ma_khoa =\''+ str(khoa) + '\' and hoc_ky='+current_term)
        columns = [col[0] for col in cursor4.description]
        dslop = [dict(zip(columns, row)) for row in cursor4.fetchall()]

        for x in dslop:
            if x["ma_lop_hoc"] == ma_lop and x["ma_mon_hoc"]==ma_mh and x["hoc_ky"]==int(current_term):
                return redirect('/qllophoc/'+str(khoa)+'/')
        else:
            with connection.cursor() as c:
                c.execute('INSERT INTO lop (ma_lop_hoc,ma_mon_hoc,hoc_ky) value(\''+str(ma_lop)+'\',\''+ma_mh+'\','+current_term+')')
        return redirect('/qllophoc/'+str(khoa)+'/')
    context={
        "ma_khoa":khoa,
        "khoa":dskhoa,
        "monhoc":monhoc,
        'gv':gv,
    }
    return render(request,'home/newlophoc.html',context)


@login_required
@allowed_users(['giangvien'])
def qlgiaotrinh(request,gv):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    
    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM nhan_vien natural join nguoi_dung natural join giang_vien where nguoi_dung.username =\''+ str(gv) + '\'')
    columns = [col[0] for col in cursor.description]
    giangvien = [dict(zip(columns, row)) for row in cursor.fetchall()][0]


    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM chi_dinh c join lop l on c.id_lop=l.idlop join mon_hoc m on m.ma_mon_hoc=l.ma_mon_hoc join nhan_vien n on n.MSNV=c.MSNV left join giao_trinh gt on gt.ISBN= c.ISBN where c.MSNV =\''+ giangvien["MSNV"] + '\' and hoc_ky='+current_term+' group by l.ma_mon_hoc ')
    columns = [col[0] for col in cursor.description]
    giaotrinh = [dict(zip(columns, row)) for row in cursor.fetchall()]


    context={
        'giangvien':giangvien,
        'giaotrinh':giaotrinh,
    }
    return render(request,'home/qlgiaotrinh.html',context)

@login_required
@allowed_users(['giangvien'])
def updategiaotrinh(request,gv,monhoc):
    db = MySQLdb.connect(user='root', db='courses_enrollment', passwd='', host='localhost')
    
    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM giao_trinh natural join nguoi_dung natural join giang_vien where giang_vien.MSNV =\''+ str(gv) + '\'')
    columns = [col[0] for col in cursor.description]
    giangvien = [dict(zip(columns, row)) for row in cursor.fetchall()][0]
    
    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM mon_hoc where ma_mon_hoc=\''+str(monhoc)+'\'')
    columns = [col[0] for col in cursor.description]
    dmonhoc = [dict(zip(columns, row)) for row in cursor.fetchall()][0]

    cursor = db.cursor()
    cursor.execute( 'SELECT * FROM giao_trinh')
    columns = [col[0] for col in cursor.description]
    giaotrinh = [dict(zip(columns, row)) for row in cursor.fetchall()]

    if request.method == 'POST':
        gt=request.POST.get('ttgiaotrinh','')
        cursor4 = db.cursor()
        cursor4.execute( 'SELECT * from chi_dinh join lop on id_lop=idlop where hoc_ky='+ current_term +' and ma_mon_hoc =\''+str(monhoc)+'\'')
        columns = [col[0] for col in cursor4.description]
        chidinh = [dict(zip(columns, row)) for row in cursor4.fetchall()]
        for c in chidinh:
            if c["ISBN"]==gt:
                return redirect('/qlgiangday/')
        for c in chidinh:
            print('////////////',c,c["idlop"],c["nam_xuat_ban"])
            with connection.cursor() as cu:
                # c.execute('UPDATE chi_dinh set MSNV=\''+str(giangvien["MSNV"])+'\' where id_lop='+str(c["idlop"]))
                cu.execute('UPDATE chi_dinh set ISBN=\''+ gt +'\' WHERE id_lop= '+str(c["idlop"]))
                # c.execute('UPDATE chi_dinh set nam_xuat_ban=\''+str(c["nam_xuat_ban"])+'\' and  ISBN=\''+str(c["ISBN"])+'\' where id_lop='+str(c["idlop"]))
        return redirect('/qlgiangday/')
        # for c in chidinh:
            #     for y in loppt:
            #         for x in y:
            #             if c["id_lop"]==x:
            #                 for j in loppt:
            #                     for i in j:
            #                         with connection.cursor() as c:
            #                             c.execute('UPDATE chi_dinh set MSNV=\''+str(gvpt)+'\' where id_lop='+str(i))
            #                 return redirect('/qlmonhoc/'+str(khoa)+'/')
            # for y in loppt:
            #     for x in y:
            #         with connection.cursor() as c:
            #             c.execute('INSERT INTO chi_dinh (MSNV,id_lop) value(\''+str(gvpt)+'\','+str(x)+')')
            # return redirect('/qlmonhoc/'+str(khoa)+'/')


    context={
        'term':current_term,
        'giangvien':giangvien,
        'monhoc':dmonhoc,
        'giaotrinh':giaotrinh,
    }
    
    return render(request,'home/updategiaotrinh.html',context)