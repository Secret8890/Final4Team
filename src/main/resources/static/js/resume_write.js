$(document).ready(function(){
    const carrer_copy = $('.career_table').last();
    let list_name = $('input[name="li_name"]');
    
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
        list_name = $('input[name="li_name"]');
        $('input[name="li_name"]').each(function(index,item){
            $(item).on('change',(event)=>{
                //alert(`${event.target.value}`);
                for(var i=0; i<list_name.length;i++) {
                    if(list_name[i] != event.target){
                        if(list_name[i].value == event.target.value) {
                            alert('동일한 자격증은 추가할 수 없습니다.');
                            event.target.value = '';
                        }
                    } 
                }
            });
        });
        //list_name.
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
        list_name = $('input[name="la_test_name"]');
        $('input[name="la_test_name"]').each(function(index,item){
            $(item).on('change',(event)=>{
                for(var i=0; i<list_name.length;i++) {
                    if(list_name[i] != event.target){
                        if(list_name[i].value == event.target.value) {
                            alert('동일한 어학시험은 추가할 수 없습니다.');
                            event.target.value = '';
                        }
                    } 
                }
            });
        });


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
        var item = 'POST';
        insert(item);       
    })
    $('#update_button').on('click',()=>{
        var item = 'PUT';
        insert(item);
    })
    

});

function insert(object) {
    const re_seq = $('#re_seq').val();
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
    const re_email = email_first + '@' + email_last;
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
    // $('input[name="ca_start"]')[2].value = ('1992-01-09');

    const career_seq = $('input[name="ca_seq"]');
    const career_co_name = $('input:text[name="ca_co_name"]');
    const career_position = $('input:text[name="ca_position"]');
    const career_dept = $('input:text[name="ca_dept"]');
    const career_duration = $('input:text[name="ca_duration"]');
    const career_ca_start = $('input[name="ca_start"]');
    const career_ca_end = $('input[name="ca_end"]');
    const career_ca_work = $('input:text[name="ca_work"]');
    const careers = [];

    for(var i=0;i<career_co_name.length;i++){
        var ca_seq = null;
        if(career_seq[i] != null || career_seq[i] != undefined) {
            ca_seq = career_seq[i].value;
        }
        var ca_co_name = career_co_name[i].value;
        var ca_position = career_position[i].value;
        var ca_dept = career_dept[i].value;
        var ca_duration = career_duration[i].value;
        let ca_start = career_ca_start[i].value;
        let ca_end = career_ca_end[i].value;
        if(ca_start == ''){
            ca_start = '1111-11-11'
        }
        if(ca_end == '') {
            ca_end = '1111-11-11'
        }
        var ca_work = career_ca_work[i].value;
        var item = {
            "ca_seq" : ca_seq,
            "ca_co_name" : ca_co_name,
            "ca_position" : ca_position,
            "ca_dept" : ca_dept,
            "ca_duration" : ca_duration,
            "ca_start" : ca_start,
            "ca_end" : ca_end,
            "ca_work" : ca_work,
        }
        careers.push(item);
    }
    const license_name = $.find('input:text[name="li_name"]');
    const license_date = $.find('input:text[name="li_date"]');
    const license_agency = $.find('input:text[name="li_agency"]');
    const license_seq = $.find('input[name="li_seq"]');
    const licenses = [];

    for (var i=0;i<license_name.length;i++) {
        var li_seq = null;
        if(license_seq[i] != null) {
            li_seq = license_seq[i].value;
        }
        var li_name = license_name[i].value;
        var li_date = license_date[i].value;
        var li_agency = license_agency[i].value;
        var item = {
                "li_seq" : li_seq,
                "li_name" : li_name,
                "li_date" : li_date, 
                "li_agency" : li_agency,
            };
        licenses.push(item);
    }
    const language_seq = $.find('input[name="la_seq"]');
    const language_name = $.find('input:text[name="la_test_name"]');
    const language_date = $.find('input:text[name="la_date"]');
    const language_score = $.find('input:text[name="la_score"]');
    const languages = [];

    for (var i=0;i<language_name.length;i++) {
        var la_seq = null;
        if(language_seq[i] != null) {
            la_seq = language_seq[i].value;
        }
        var la_test_name = language_name[i].value;
        var la_date = language_date[i].value;
        var la_score = language_score[i].value;
        var item = {
                "la_seq" : la_seq,
                "la_test_name" : la_test_name,
                "la_date" : la_date, 
                "la_score" : la_score};
        languages.push(item);
    }
    
    if(re_highstartdate == '') {
        re_highstartdate = '1111-11-11';
    }
    if(re_highenddate == '') {
        re_highenddate = '1111-11-11';
    }
    if(re_univsdate == '') {
        re_univsdate = '1111-11-11';
    }
    if(re_univedate == '') {
        re_univedate = '1111-11-11';
    }
    if(re_mastersdate == '') {
        re_mastersdate = '1111-11-11';
    }
    if(re_masteredate == '') {
        re_masteredate = '1111-11-11';
    }
    $.ajax({
        url : '/resume',
        type : object,
        data : {
            re_seq : re_seq,
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
            careers : JSON.stringify(careers),
            licenses : JSON.stringify(licenses),
            languages : JSON.stringify(languages),
        },
        success : (data)=>{
            if(data){
                $('#load-section').load('/resume/intro_manage');
            } else {
                alert('서버수신실패');
            }
        }
    });
}