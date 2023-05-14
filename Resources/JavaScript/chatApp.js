/*function noredirect() {
    document.getElementById('<%= BtnHidden.ClientID %>').click();
    return;
}*/





/*const { spawn } = require('child_process');

const pythonProcess = spawn('python', ['subchat.py', 'adam']);

pythonProcess.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`);
});

pythonProcess.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`);
});

pythonProcess.on('close', (code) => {
    console.log(`child process exited with code ${code}`);
});*/

function redirect() {
    window.location.href = 'http://localhost:5173';
}




/*
function redirect() {
    $.ajax({
        url: 'http://localhost:44330/subchat.py?arg1=adam',
        success: function (data) {
            console.log(data);
        }
    });


    //window.location.href = 'http://localhost:5173?uname=rick';
}
*/