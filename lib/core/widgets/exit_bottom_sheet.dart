import 'package:fitiq/core/theame/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<bool?> showExitBottomSheet({
  String? imageAsset,
  String? imageUrl,
  required BuildContext context,
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isTablet = screenWidth >= 600;

  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: false,
    enableDrag: false,
    builder: (ctx) {
      final screenHeight = MediaQuery.of(ctx).size.height;

      final sheet = Container(
        height: isTablet ? 480 : screenHeight * 0.5,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      "Are you sure you want\nto exit the app?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(ctx, false),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: _buildImage(
                    imageAsset: imageAsset,
                    imageUrl: imageUrl,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                    // Navigator.pop(ctx, true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Exit",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      if (isTablet) {
        return Center(child: SizedBox(width: 420, child: sheet));
      }

      return sheet;
    },
  );
}

Widget _buildImage({String? imageAsset, String? imageUrl}) {
  if (imageAsset != null) {
    final isSvg = imageAsset.toLowerCase().endsWith('.svg');
    if (isSvg) {
      return SvgPicture.asset(
        imageAsset,
        fit: BoxFit.contain,
        width: double.infinity,
        placeholderBuilder: (_) => _placeholderImage(),
      );
    }
    return Image.asset(imageAsset, fit: BoxFit.contain, width: double.infinity);
  }
  if (imageUrl != null) {
    final isSvg = imageUrl.toLowerCase().contains('.svg');
    if (isSvg) {
      return SvgPicture.network(
        imageUrl,
        fit: BoxFit.contain,
        width: double.infinity,
        placeholderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
      );
    }
    return Image.network(
      imageUrl,
      fit: BoxFit.contain,
      width: double.infinity,
      loadingBuilder: (_, child, progress) => progress == null
          ? child
          : const Center(child: CircularProgressIndicator()),
      errorBuilder: (ctx, e, s) => _placeholderImage(),
    );
  }
  return _placeholderImage();
}

Widget _placeholderImage() {
  return Container(
    color: Colors.grey.shade100,
    child: const Center(
      child: Icon(
        Icons.image_not_supported_outlined,
        size: 48,
        color: Colors.grey,
      ),
    ),
  );
}
