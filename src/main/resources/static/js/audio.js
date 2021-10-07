//webkitURL is deprecated but nevertheless
URL = window.URL || window.webkitURL;

var gumStream; //stream from getUserMedia()
var rec; //Recorder.js object
var input; //MediaStreamAudioSourceNode we'll be recording

// shim for AudioContext when it's not avb.
var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext; //audio context to help us record

var recordButton = document.getElementById("recordButton");
var stopButton = document.getElementById("stopButton");
var pauseButton = document.getElementById("pauseButton");

//add events to those 2 buttons
recordButton.addEventListener("click", startRecording);
stopButton.addEventListener("click", stopRecording);
pauseButton.addEventListener("click", pauseRecording);

function startRecording() {
    console.log("recordButton clicked");

    /*
                                                                                		Simple constraints object, for more advanced audio features see
                                                                                		https://addpipe.com/blog/audio-constraints-getusermedia/
                                                                                	*/

    var constraints = {
        audio: true,
        video: false,
    };

    /*
                                                                                    	Disable the record button until we get a success or fail from getUserMedia() 
                                                                                	*/

    recordButton.disabled = true;
    stopButton.disabled = false;
    pauseButton.disabled = false;

    /*
                                                                                    	We're using the standard promise based getUserMedia() 
                                                                                    	https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia
                                                                                	*/

    navigator.mediaDevices
        .getUserMedia(constraints)
        .then(function(stream) {
            console.log(
                "getUserMedia() success, stream created, initializing Recorder.js ..."
            );

            /*
    			create an audio context after getUserMedia is called
    			sampleRate might change after getUserMedia is called, like it does on macOS when recording through AirPods
    			the sampleRate defaults to the one set in your OS for your playback device
    		*/
            audioContext = new AudioContext();

            /*  assign to gumStream for later use  */
            gumStream = stream;

            /* use the stream */
            input = audioContext.createMediaStreamSource(stream);

            /* 
    			Create the Recorder object and configure to record mono sound (1 channel)
    			Recording 2 channels  will double the file size
    		*/
            rec = new Recorder(input, {
                numChannels: 1,
            });

            //start the recording process
            rec.record();

            console.log("Recording started");
        })
        .catch(function(err) {
            //enable the record button if getUserMedia() fails
            recordButton.disabled = false;
            stopButton.disabled = true;
            pauseButton.disabled = true;
        });
}

function pauseRecording() {
    console.log("pauseButton clicked rec.recording=", rec.recording);
    if (rec.recording) {
        //pause
        rec.stop();
        pauseButton.innerHTML = "Resume";
    } else {
        //resume
        rec.record();
        pauseButton.innerHTML = "Pause";
    }
}

function stopRecording() {
    console.log("stopButton clicked");

    //disable the stop button, enable the record too allow for new recordings
    stopButton.disabled = true;
    recordButton.disabled = false;
    pauseButton.disabled = true;

    //reset button just in case the recording is stopped while paused
    pauseButton.innerHTML = "Pause";

    //tell the recorder to stop the recording
    rec.stop();

    //stop microphone access
    gumStream.getAudioTracks()[0].stop();

    //create the wav blob and pass it on to createDownloadLink
    rec.exportWAV(createDownloadLink);
    // setTimeout(function() {
    //     saveFile();
    // }, 1000);
}

function createDownloadLink(blob) {
    var url = URL.createObjectURL(blob);
    var au = document.createElement("audio");
    var link = document.createElement("a");

    //name of .wav file to use during upload and download (without extendion)
    var filename = new Date().toISOString();
    //console.log("file:"+filename);

    //add controls to the <audio> element
    au.controls = true;
    au.src = url;

    //save to disk link
    link.href = url;
    link.download = filename + ".wav"; //download forces the browser to donwload the file using the  filename
    //link.innerHTML = "Save to disk";

    var wav = filename + ".wav";

    //add the new audio element to li
    //li.appendChild(au);

    //add the filename to the li
    //li.appendChild(document.createTextNode(filename+".wav "))

    //add the save to disk link to li
    //li.appendChild(link);

    //upload link
    var xhr = new XMLHttpRequest();
    var fd = new FormData();
    fd.append("audio_data", blob, "record.wav");
    console.log("filename:" + filename);
    console.log("fd" + fd);
    for (var pair of fd.entries()) {
        console.log(pair[0] + "," + pair[1] + ", " + pair[2]);
    }
    //xhr.open("POST","../test/plz.json",true);
    //xhr.send(fd);
    $(function() {
        console.log("실행");
        $.ajax({
            url: "../record",
            type: "POST",
            enctype: "multipart/form-data",
            contentType: false,
            data: fd,
            cache: false,
            processData: false,
            success: function(data) {
                sendVoice(data);
            },
            erorr: function(data) {
                alert(data);
            },
        });
    });
    //add the li element to the ol
}

// function saveFile(blob) {
//     console.log("saveFile Exe");
//     var xhr = new XMLHttpRequest();
//     /*xhr.onload=function(e) {
//                                     if(this.readyState === 4) {
//                                         console.log("Server returned: ",e.target.responseText);
//                                     }
//                                 };*/
//     var fd = new FormData();
//     //fd.append("audio_data",blob, filename);
//     fd.append("audio_data", blob, "record.wav");
//     //fd.append("audio_data",blob, wav);
//     console.log("filename:" + filename);
//     console.log("fd" + fd);
//     for (var pair of fd.entries()) {
//         console.log(pair[0] + "," + pair[1] + ", " + pair[2]);
//     }
//     //xhr.open("POST","../test/plz.json",true);
//     //xhr.send(fd);
//     $(function() {
//         console.log("실행");
//         $.ajax({
//             url: "../record",
//             type: "POST",
//             enctype: "multipart/form-data",
//             contentType: false,
//             data: fd,
//             cache: false,
//             processData: false,
//             success: function(data) {
//                 alert(data);
//             },
//             erorr: function(data) {
//                 alert(data);
//             },
//         });
//     });
// }

var socket=null;
var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    $("#send").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    } else {
        $("#conversation").hide();
    }
    $("#msg").html("");
}

function connect() {
    socket = new SockJS("/ws");
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame) {
        setConnected(true);
        console.log("Connected: " + frame);
        stompClient.subscribe("/topic/public", function(message) {
            showMessage("받은 메시지: " + message.body); //서버에 메시지 전달 후 리턴받는 메시지
            $.ajax({
                url: "../botSound",
                type: "POST",
                data: { say: message.body },
                success: function(data) {
                    setTimeout(function() {
                        var audio = new Audio("/audio/" + data);
                        audio.play();
                    }, 3000);
                },
            });
        });
        //stompClient.send('/app/sendMessage',{},JSON.stringify("Q1"));
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
        //socket.close();
        $("#communicate").html(""); //이전 내용 비우기
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendMessage() {
    let message = $("#msg").val();
    showMessage("보낸 메시지: " + message);

    stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); //서버에 보낼 메시지
}

function sendVoice(msg) {
    showMessage("보낸 메시지: " + msg);

    stompClient.send("/app/sendMessage", {}, JSON.stringify(msg)); //서버에 보낼 메시지
}

function showMessage(message) {
    $("#communicate").append("<tr><td>" + message + "</td></tr>");
}

$(function() {
    $("form").on("submit", function(e) {
        e.preventDefault();
    });
    $("#connect").click(function() {
        connect();
    });
    $("#disconnect").click(function() {
        disconnect();
    });
    $("#send").click(function() {
        sendMessage();
    });
});