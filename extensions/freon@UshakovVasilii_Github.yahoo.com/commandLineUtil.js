const ByteArray = imports.byteArray;
const GLib = imports.gi.GLib;
const Gio = imports.gi.Gio;

var CommandLineUtil = class {

    constructor(){
        this._argv = null;
        this._updated = false;
    }

    execute(callback) {
        try{
            this._callback = callback;

            let proc = Gio.Subprocess.new(this._argv,
                                          Gio.SubprocessFlags.STDOUT_PIPE |
                                          Gio.SubprocessFlags.STDERR_PIPE);

            proc.communicate_utf8_async(null, null, (proc, result) => {
                try {
                    let [, stdout, stderr] = proc.communicate_utf8_finish(result);

                    this._output = stdout ? stdout.split('\n') : [];
                    this._error_output = stderr ? stderr.split('\n') : [];
                } catch (e) {
                    logError(e);
                } finally {
                    callback();
                    this._updated = true;
                }
            });
        } catch(e){
            global.log(e.toString());
        }
    }

    get available(){
        return this._argv != null;
    }

    get updated (){
       return this._updated;
    }

    set updated (updated){
        this._updated = updated;
    }

    destroy(){
        this._argv = null;
    }

};
