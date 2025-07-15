import 'package:chat_app/global/themes/extensions/design_text_styles.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/todo/application/todo_bloc.dart';
import 'package:chat_app/modules/todo/application/todo_event.dart';
import 'package:chat_app/modules/todo/application/todo_state.dart';
import 'package:chat_app/modules/todo/domain/entities/create_todo_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class TodoPageNewTodoSheet extends StatefulWidget {
  const TodoPageNewTodoSheet({super.key});

  @override
  State<TodoPageNewTodoSheet> createState() => _TodoPageNewTodoSheetState();
}

class _TodoPageNewTodoSheetState extends State<TodoPageNewTodoSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _submitForm({required int userId}) {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      context.read<TodoBloc>().add(
        CreateTodoEvent(
          title: values['title'] as String,
          description: values['description'] as String?,
          userId: userId,
        ),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<TodoBloc, TodoBlocState>(
      listener: (context, state) {
        if (state.createTodoResult is CreateTodoSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.todoCreated)));
        } else if (state.createTodoResult is CreateTodoFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.todoCreationFailed)));
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.addNewTodo,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              Flexible(
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormBuilderTextField(
                          name: 'title',
                          decoration: InputDecoration(
                            labelText: l10n.title,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: l10n.cannotBeEmpty,
                            ),
                            FormBuilderValidators.maxLength(
                              40,
                              errorText: l10n.maxFortyChars,
                            ),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        FormBuilderTextField(
                          name: 'description',
                          decoration: InputDecoration(
                            labelText: l10n.description,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) return null;
                            if (value.length > 200) {
                              return l10n.maxTwoHunderedChars;
                            }

                            return null;
                          },
                          maxLines: 3,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text(
                                  l10n.cancel,
                                  style: Theme.of(context)
                                      .extension<DesignTextStyles>()
                                      ?.secondaryButtonTextStyle,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: BlocBuilder<TodoBloc, TodoBlocState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      if (state.currentLoggedInUser?.id !=
                                          null) {
                                        _submitForm(
                                          userId:
                                              state.currentLoggedInUser!.id!,
                                        );
                                      }
                                    },
                                    child: Text(
                                      l10n.addTodo,
                                      style: Theme.of(context)
                                          .extension<DesignTextStyles>()
                                          ?.buttonTextStyle,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
