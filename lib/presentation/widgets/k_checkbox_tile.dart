import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import 'widgets.dart';

class KCheckBoxTile extends StatelessWidget {
  const KCheckBoxTile(
      {Key? key,
      this.value,
      this.onChanged,
      required this.title,
      this.trailing,
      this.padding})
      : super(key: key);

  final bool? value;
  final void Function(bool?)? onChanged;
  final String title;
  final String? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: () => onChanged?.call(value),
      child: Padding(
        padding: padding ?? EdgeInsetsDirectional.fromSTEB(4.w, 0, 20.w, 0),
        child: Row(
          crossAxisAlignment: crossCenter,
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              tristate: true,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
              ),
            ),
            Text(
              title,
              style: CustomTextStyle.textStyle14w400,
            ),
            const Spacer(),
            trailing != null
                ? Text(
                    trailing!,
                    style: CustomTextStyle.textStyle10w600Secondary,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
