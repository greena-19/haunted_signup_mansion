
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signup Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  // Local demo tips. No network or AI service is used.
  final Map<String, List<String>> _presetTips = {
    'password_help': [
      'Use a long, unique password for each account.',
      'Consider using a password manager.',
      'Avoid including personal information in passwords.',
    ],
  };

  bool _isLoading = false;
  bool _hasTipError = false;
  bool _simulateMissingTip = false;
  String? _currentTip;
  int _tipIndex = 0;

  Future<void> _getSignupTip() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _hasTipError = false;
      _currentTip = null;
    });

    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    final tips = _simulateMissingTip
        ? <String>[]
        : (_presetTips['password_help'] ?? []);

    final validTips = tips
        .where((tip) => tip.trim().isNotEmpty && tip.length <= 240)
        .toList();

    if (validTips.isEmpty) {
      setState(() {
        _isLoading = false;
        _hasTipError = true;
      });
      return;
    }

    setState(() {
      _currentTip = validTips[_tipIndex % validTips.length];
      _tipIndex++;
      _isLoading = false;
    });
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Demo signup validation successful!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WelcomePage(name: name),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Practice'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Your Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  final email = value.trim();
                  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                      .hasMatch(email)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _confirmController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.verified_user),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 12),

              const Text(
                'Local Signup Coach',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                'Preset demo content — not live AI output.',
              ),
              const SizedBox(height: 12),

              ElevatedButton.icon(
                onPressed: _isLoading ? null : _getSignupTip,
                icon: const Icon(Icons.lightbulb_outline),
                label: const Text('Get a signup tip'),
              ),

              SwitchListTile(
                title: const Text('Simulate missing tip data'),
                subtitle: const Text('Practice error and retry'),
                value: _simulateMissingTip,
                onChanged: _isLoading
                    ? null
                    : (value) {
                        setState(() {
                          _simulateMissingTip = value;
                        });
                      },
              ),

              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

              if (_currentTip != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Preset demo tip:\n\n$_currentTip',
                    ),
                  ),
                ),

              if (_hasTipError)
                Column(
                  children: [
                    const Text(
                      'No local signup tip is available.',
                      style: TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: _getSignupTip,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),

              const SizedBox(height: 12),
              const Text(
                'Tips do not use your name, email, or password. '
                'They do not validate or approve signup.',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String name;

  const WelcomePage({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.celebration,
              color: Colors.purple,
              size: 72,
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome, $name!',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text('Your demo form passed validation.'),
          ],
        ),
      ),
    );
  }
}
