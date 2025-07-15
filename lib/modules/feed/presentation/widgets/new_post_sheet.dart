import 'dart:io';

import 'package:chat_app/global/themes/extensions/design_text_styles.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/feed/application/feed_bloc.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_event.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_state.dart';
import 'package:chat_app/modules/feed/domain/entities/create_post_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class FeedPageNewPostSheet extends StatefulWidget {
  const FeedPageNewPostSheet({super.key});

  @override
  State<FeedPageNewPostSheet> createState() => _FeedPageNewPostSheetState();
}

class _FeedPageNewPostSheetState extends State<FeedPageNewPostSheet> {
  final _formKey = GlobalKey<FormBuilderState>();
  XFile? _selectedImage;
  String? _permanentImagePath;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );
      if (image != null) {
        // Save image to permanent location
        final String permanentPath = await _saveImageToPermanentLocation(image);
        setState(() {
          _selectedImage = image;
          _permanentImagePath = permanentPath;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error picking image: $e')));
      }
    }
  }

  Future<String> _saveImageToPermanentLocation(XFile image) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String imagesDir = path.join(appDocDir.path, 'post_images');

    // Create the directory if it doesn't exist
    await Directory(imagesDir).create(recursive: true);

    // Generate a unique filename
    final String fileName =
        '${DateTime.now().millisecondsSinceEpoch}${path.extension(image.path)}';
    final String permanentPath = path.join(imagesDir, fileName);

    // Copy the image to the permanent location
    await File(image.path).copy(permanentPath);

    return permanentPath;
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _permanentImagePath = null;
    });
  }

  void _submitForm({
    required int userId,
    required String firstName,
    required String lastName,
  }) {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final values = _formKey.currentState!.value;

      context.read<FeedBloc>().add(
        CreatePostEvent(
          title: values['title'] as String,
          description: values['description'] as String,
          imagePath: _permanentImagePath,
          userId: userId,
          firstName: firstName,
          lastName: lastName,
        ),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<FeedBloc, FeedBlocState>(
      listener: (context, state) {
        if (state.createPostResult is CreatePostSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.postCreationSuccessful)));
        } else if (state.createPostResult is CreatePostFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.postCreationFailed)));
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
                l10n.newPost,
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: l10n.title,
                            border: OutlineInputBorder(),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: l10n.cannotBeEmpty,
                            ),
                            FormBuilderValidators.maxLength(
                              100,
                              errorText: l10n.maxHunderedChars,
                            ),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        FormBuilderTextField(
                          name: 'description',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: l10n.description,
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                          maxLines: 4,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: l10n.cannotBeEmpty,
                            ),
                            FormBuilderValidators.maxLength(
                              500,
                              errorText: l10n.maxFiveHunderedChars,
                            ),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.optionalImage,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        if (_selectedImage != null) ...[
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(_permanentImagePath!),
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: _removeImage,
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                        ElevatedButton.icon(
                          onPressed: _pickImage,
                          icon: Icon(Icons.image),
                          label: Text(
                            _selectedImage != null
                                ? l10n.changeImage
                                : l10n.addImage,
                            style: Theme.of(
                              context,
                            ).extension<DesignTextStyles>()?.buttonTextStyle,
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => context.pop(),
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
                              child: BlocBuilder<FeedBloc, FeedBlocState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      _submitForm(
                                        userId: state.currentLoggedInUser!.id!,
                                        firstName:
                                            state
                                                .currentLoggedInUser
                                                ?.firstName ??
                                            '',
                                        lastName:
                                            state
                                                .currentLoggedInUser
                                                ?.lastName ??
                                            '',
                                      );
                                    },
                                    child: Text(
                                      l10n.createPost,
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
