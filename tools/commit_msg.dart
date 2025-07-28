import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln('❌ Missing commit message file path.');
    exit(1);
  }

  final commitFilePath = arguments[0];
  final message = File(commitFilePath).readAsStringSync().trim();

  // Define the commit format
  final regex = RegExp(
    r'^(✨|🐛|🔧|🎨|♻️|🧪|📝|🚀|📦|⬆️|🔒|🔥|⏪️|🚧) (feat|fix|chore|style|refactor|test|docs|perf|build|upgrade|security|remove|revert|wip)(\([\w-]+\))?: .+',
  );

  if (!regex.hasMatch(message)) {
    stderr
      ..writeln('❌ Invalid commit message!')
      ..writeln('Your message:\n  "$message"\n')
      ..writeln('✅ Format: <emoji> <type>(scope): short description')
      ..writeln('Examples:')
      ..writeln('  ✨ feat(auth): add biometric login')
      ..writeln('  🐛 fix(cart): crash on empty cart\n')
      ..writeln('-----   ---------  ------------------------------------------')
      ..writeln('Emoji   Type       Description')
      ..writeln('-----   ---------  ------------------------------------------')
      ..writeln('✨      feat       Introducing a new feature')
      ..writeln('🐛      fix        Fixing a bug')
      ..writeln('♻️      refactor   Refactoring code (no feature or fix)')
      ..writeln('📦      build      Build system or dependency changes')
      ..writeln('🚀      perf       Improving performance')
      ..writeln('📝      docs       Documentation changes')
      ..writeln('🧪      test       Adding or updating tests')
      ..writeln('💄      style      Non-functional code changes (formatting)')
      ..writeln('🔧      chore      Miscellaneous tasks (config, cleanup)')
      ..writeln('⬆️      upgrade    Upgrading dependencies')
      ..writeln('🔒      security   Security fixes')
      ..writeln('🔥      remove     Removing code or files')
      ..writeln('⏪️      revert     Reverting changes')
      ..writeln('🚧      wip        Work in progress')
      ..writeln(
        '-----   ---------  ------------------------------------------',
      );
    exit(1);
  }

  stdout.writeln('✅ Commit message valid!');
}
