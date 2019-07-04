<?php

namespace Test\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class MailClass extends Mailable
{
    use Queueable, SerializesModels;

    protected $tema;
    protected $soob;
    protected $user;
    protected $file;
    protected $DT;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($tema,$soob,$user,$file,$DT)
    {
        $this->tema=$tema;
        $this->soob=$soob;
        $this->user=$user;
        $this->file=$file;
        $this->DT=$DT;
        //
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.contact-mail')
            ->with([
                'tema'=>$this->tema,
                'soob'=>$this->soob,
                'user'=>$this->user,
                'file'=>$this->file,
                'DT'=>$this->DT,
            ])->subject('Новое письмо');
    }
}
