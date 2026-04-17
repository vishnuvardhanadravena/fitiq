import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class CustomFileUpload extends StatefulWidget {
  final String label;
  final String hintText;

  /// File
  final File? initialFile;
  final Function(File file)? onFileSelected;
  final VoidCallback? onRemove;

  /// UI Control
  final bool enabled;
  final bool showRemoveButton;
  final double height;

  /// Customization
  final IconData uploadIcon;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  /// File Types
  final List<String>? allowedExtensions;

  const CustomFileUpload({
    super.key,
    required this.label,
    this.hintText = "Upload File",
    this.initialFile,
    this.onFileSelected,
    this.onRemove,
    this.enabled = true,
    this.showRemoveButton = true,
    this.height = 120,
    this.uploadIcon = Icons.upload_file,
    this.borderColor = const Color(0xFFE0E0E0),
    this.backgroundColor = const Color(0xFFF7F7F7),
    this.textColor = Colors.grey,
    this.allowedExtensions,
  });

  @override
  State<CustomFileUpload> createState() => _CustomFileUploadState();
}

class _CustomFileUploadState extends State<CustomFileUpload> {
  File? _file;

  @override
  void initState() {
    super.initState();
    _file = widget.initialFile;
  }

  Future<void> _pickFile() async {
    if (!widget.enabled) return;

    final result = await FilePicker.pickFiles(
      type: widget.allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: widget.allowedExtensions,
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);

      setState(() => _file = file);
      widget.onFileSelected?.call(file);
    }
  }

  void _removeFile() {
    setState(() => _file = null);
    widget.onRemove?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔤 LABEL
        Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),

        const SizedBox(height: 10),

        /// 📦 UPLOAD BOX
        GestureDetector(
          onTap: _pickFile,
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: const [6, 4],
              strokeWidth: 1.5,
              radius: const Radius.circular(16),
              color: widget.borderColor,
              padding: const EdgeInsets.all(4),
            ),
            child: Container(
              height: widget.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: _file == null ? _buildEmpty() : _buildFileView(),
            ),
          ),
        ),
      ],
    );
  }

  /// 🔽 EMPTY STATE
  Widget _buildEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(widget.uploadIcon, color: widget.textColor),
        const SizedBox(height: 8),
        Text(widget.hintText, style: TextStyle(color: widget.textColor)),
      ],
    );
  }

  /// 📄 FILE VIEW
  Widget _buildFileView() {
    final fileName = _file!.path.split('/').last;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file),
          const SizedBox(width: 10),

          /// File Name
          Expanded(child: Text(fileName, overflow: TextOverflow.ellipsis)),

          /// Remove Button
          if (widget.showRemoveButton)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: _removeFile,
            ),
        ],
      ),
    );
  }
}
