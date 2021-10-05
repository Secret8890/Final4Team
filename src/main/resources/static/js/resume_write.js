$(document).ready(function(){
    const carrer_copy = $('.career_table').last();
    $('#addCarrer').on('click',()=>{
        const copy = carrer_copy.clone(true);
        //var today = new Date().toISOString().split('T')[0];
        copy.find('input:text').val('');
        //copy.querySelector('input[type="date"]').value = today;
        copy.find('input[type="date"]').val('');
        $('.carrer_area').append(copy);
    });
    $('#removeCarrer').on('click',()=>{
        if($('.career_table').length >1){
            $('.career_table').last().remove();
        } else {
            alert('경력항목은 한개 이상 있어야 합니다.')
        }
    });
    const license_copy = $('.license_table').last();
    $('#addLicense').on('click',()=>{
        const copy = license_copy.clone(true);
        copy.find('input:text').val('');
        //copy.find('input[type="date"]').val('');
        $('.license_area').append(copy);
    });
    $('#removeLicense').on('click',()=>{
        if($('.license_table').length >1){
            $('.license_table').last().remove();
        } else {
            alert('자격증 항목은 한개 이상 있어야 합니다.')
        }
    });

    const language_copy = $('.language_table').last();
    $('#addLanguage').on('click',()=>{
        const copy = language_copy.clone(true);
        copy.find('input:text').val('');
        //copy.find('input[type="date"]').val('');
        $('.language_area').append(copy);
    });
    $('#removeLanguage').on('click',()=>{
        if($('.language_table').length >1){
            $('.language_table').last().remove();
        } else {
            alert('어학 항목은 한개 이상 있어야 합니다.')
        }
    });



    $('#save_button').on('click', ()=>{
        const u_seq = $('#u_seq').val();
        const re_title = $('#re_title').val();
        const re_name = $('#re_name').val();
        const re_birth = $('#re_birth').val();
        const re_gender = $('#re_gender').val();
        const re_military = $('#re_military').val();
        const re_zipcode = $('#re_zipcode').val();
        const re_address = $('#re_address').val();
        const re_phone = $('#re_phone').val();
        const email_first = $('#email_first').val();
        const email_last = $('#email_last').val();
        const re_email = email_first.value + '@' + email_last.value;
        const re_high = $('#re_high').val();
        const re_highmajor = $('#re_highmajor').val();
        const re_highstatus = $('#re_highstatus').val();
        let re_highstartdate = $('#re_highstartdate').val();
        let re_highenddate = $('#re_highenddate').val();
        const re_univ = $('#re_univ').val();
        const re_univmajor = $('#re_univmajor').val();
        const re_univstatus = $('#re_univstatus').val();
        const re_univgrade = $('#re_univgrade').val();
        let re_univsdate = $('#re_univsdate').val();
        let re_univedate = $('#re_univedate').val();
        const re_master = $('#re_master').val();
        const re_mastermajor = $('#re_mastermajor').val();
        const re_masterstatus = $('#re_masterstatus').val();
        const re_mastergrade = $('#re_mastergrade').val();
        let re_mastersdate = $('#re_mastersdate').val();
        let re_masteredate = $('#re_masteredate').val();
        const ca_co_name = $('input[name="ca_co_name"]').val();
        const ca_position = $('input[name="ca_position"]').val();
        const ca_dept = $('input[name="ca_dept"]').val();
        const ca_duration = $('input[name="ca_duration"]').val();
        let ca_start = $('input[name="ca_start"]').val();
        let ca_end = $('input[name="ca_end"]').val();
        const ca_work = $('input[name="ca_work"]').val();
        const li_name = $('input[name="li_name"]').val();
        const li_date = $('input[name="li_date"]').val();
        const li_agency = $('input[name="li_agency"]').val();
        const la_test_name = $('input[name="la_test_name"]').val();
        const la_date = $('input[name="la_date"]').val();
        
        if($('#re_highstartdate').empty()) {
            //re_highstartdate.datepicker('setDate','');
            re_highstartdate = '1111-11-11';
        }
        if($('#re_highenddate').empty()) {
            re_highenddate = '1111-11-11';
        }
        if($('#re_univsdate').empty()) {
            re_univsdate = '1111-11-11';
        }
        if($('#re_univedate').empty()) {
            re_univedate = '1111-11-11';
        }
        if($('#re_mastersdate').empty()) {
            re_mastersdate = '1111-11-11';
        }
        if($('#re_masteredate').empty()) {
            re_masteredate = '1111-11-11';
        }
        if($('input[name="ca_start"]').empty()) {
            ca_start = '1111-11-11';
        }
        if($('input[name="ca_end"]').empty()) {
            ca_end = '1111-11-11';
        }
        $.ajax({
            url : 'resume/write1',
            type : 'POST',
            data : {
                u_seq : u_seq,
                re_title : re_title,
                re_name : re_name,
                re_birth : re_birth,
                re_gender : re_gender,
                re_military : re_military,
                re_zipcode : re_zipcode,
                re_address : re_address,
                re_phone : re_phone,
                re_email : re_email,
                re_high : re_high,
                re_highmajor : re_highmajor,
                re_highstatus : re_highstatus,
                re_highstartdate : re_highstartdate,
                re_highenddate : re_highenddate,
                re_univ : re_univ,
                re_univmajor : re_univmajor,
                re_univstatus : re_univstatus,
                re_univgrade : re_univgrade,
                re_univsdate : re_univsdate,
                re_univedate : re_univedate,
                re_master : re_master,
                re_mastermajor : re_mastermajor,
                re_masterstatus : re_masterstatus,
                re_mastergrade : re_mastergrade,
                re_mastersdate : re_mastersdate,
                re_masteredate : re_masteredate,
                ca_co_name : ca_co_name,
                ca_position : ca_position,
                ca_dept : ca_dept,
                ca_duration : ca_duration,
                ca_start : ca_start,
                ca_end : ca_end,
                ca_work : ca_work,
                li_name : li_name,
                li_date : li_date,
                li_agency : li_agency,
                la_test_name : la_test_name,
                la_date : la_date
            },
            success : (data)=>{
                if(data){
                    alert('서버수신성공');
                    $('#load-section').load('resume/list');
                } else {
                    alert('서버수신실패');
                }
            }
        })
    })
});