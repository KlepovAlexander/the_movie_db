import 'package:flutter/material.dart';
import 'package:the_movie_db/Theme/button_style.dart';
import 'package:the_movie_db/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Войти в свою учётную запись'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [_HeaderWidget()],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override


  Widget build(BuildContext context) {


    final textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 25),
          Text(
            "Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации,необходимо войти "
            " в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой.",
            style: textStyle,
          ),
          SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Регистрация'),
          ),
          SizedBox(height: 25),
          Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь,',
            style: textStyle,
          ),
          SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Подтвердите электронную почту'),
          )
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      // Navigator.of(context).pushReplacementNamed('/main_screen');
      Navigator.of(context).pushNamed('/main_screen');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );

    final color = const Color(0xFF01B4E4);
    final textFieldDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
            ),
          )
        ],
        SizedBox(height: 20),
        Text(
          'Имя пользователя',
          style: textStyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textFieldDecoration,
          controller: _loginTextController,
        ),
        SizedBox(
          height: 20,
        ),
        Text('Пароль', style: textStyle),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                ),
              ),
              onPressed: _auth,
              child: Text('Войти'),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
                style: AppButtonStyle.linkButton,
                onPressed: _resetPassword,
                child: Text('Сбросить пароль'))
          ],
        )
      ],
    );
  }
}
