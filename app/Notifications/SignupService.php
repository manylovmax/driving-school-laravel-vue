<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class SignupService extends Notification
{
    use Queueable, SerializesModels;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {

      return (new MailMessage)
          ->subject('[Автошкола БГТУ "ВОЕНМЕХ"] Новый клиент')
          ->line('Вы успешно записались в автошколу!')
          ->line('Пожалуйста, подтвердите Ваш адрес электронной почты, чтобы мы могли уведомлять Вас об изменениях в учебном процессе.')
          ->action('Подтвердить email', url($url))
          ->line('Спасибо за выбор наших услуг!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }

    public function build()
    {
        return $this->from('sender@example.com')
        ->view('mails.new_user')
        ->with(
          [
                'data' => '1',
                'testVarTwo' => '2',
          ])
          ->attach(public_path('/images').'/demo.jpg', [
                  'as' => 'demo.jpg',
                  'mime' => 'image/jpeg',
          ]);
    }
}
