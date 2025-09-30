import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team_25_app/theme/app_colors.dart';
import 'package:team_25_app/services/api_service.dart';
import 'package:team_25_app/screens/model_viewer/model_viewer_screen.dart';
import 'package:team_25_app/widgets/common_app_bar.dart';

class MoleculeBuilderScreen extends ConsumerStatefulWidget {
  const MoleculeBuilderScreen({super.key});

  @override
  ConsumerState<MoleculeBuilderScreen> createState() => _MoleculeBuilderScreenState();
}

class _MoleculeBuilderScreenState extends ConsumerState<MoleculeBuilderScreen> {
  // 選択中の元素（nullの場合は何も選択していない）
  String? selectedElement = 'C';

  // 構築中の分子データ
  List<Atom> atoms = [];
  List<Bond> bonds = [];

  // ドラッグ関連
  Atom? draggedAtom;
  Offset? dragOffset;

  // 結合タイプの選択
  BondType selectedBondType = BondType.single;

  // 選択中の原子（削除・移動用）
  Atom? selectedAtom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        showBackButton: false,
        navigateToHistoryOnTap: false,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // 元素パレット（子ども向けのカラフルなUI）
              _buildElementPalette(),

              // 構築エリア
              Expanded(
                child: Stack(
                  children: [
                    // グリッド背景
                    CustomPaint(
                      painter: GridPainter(),
                      size: Size.infinite,
                    ),

                    // 分子ビルダーキャンバス
                    GestureDetector(
                      onTapUp: (details) => _handleTap(details.localPosition),
                      onPanStart: (details) => _startDrag(details.localPosition),
                      onPanUpdate: (details) => _updateDrag(details.localPosition),
                      onPanEnd: (_) => _endDrag(),
                      child: CustomPaint(
                        painter: MoleculePainter(
                          atoms: atoms,
                          bonds: bonds,
                          draggedAtom: draggedAtom,
                          dragOffset: dragOffset,
                          selectedAtom: selectedAtom,
                        ),
                        size: Size.infinite,
                      ),
                    ),
                  ],
                ),
              ),

              // ツールバー
              _buildToolbar(),
            ],
          ),

          // ホームボタン（左下）
          Positioned(
            left: 16,
            bottom: 100,
            child: FloatingActionButton(
              onPressed: () {
                // 履歴画面（ホーム）に戻る - 元の戻るボタンと同じロジック
                Navigator.of(context).canPop()
                  ? Navigator.of(context).pop()
                  : context.go('/history');
              },
              backgroundColor: AppColors.primary,
              child: const Icon(
                Icons.home,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElementPalette() {
    final commonElements = [
      {'symbol': 'H', 'name': '水素', 'color': Colors.white},
      {'symbol': 'C', 'name': '炭素', 'color': Colors.grey[800]},
      {'symbol': 'N', 'name': '窒素', 'color': Colors.blue},
      {'symbol': 'O', 'name': '酸素', 'color': Colors.red},
      {'symbol': 'F', 'name': 'フッ素', 'color': Colors.green},
      {'symbol': 'Na', 'name': 'ナトリウム', 'color': Colors.purple[300]},
      {'symbol': 'Si', 'name': 'ケイ素', 'color': Colors.brown[300]},
      {'symbol': 'P', 'name': 'リン', 'color': Colors.orange},
      {'symbol': 'S', 'name': '硫黄', 'color': Colors.yellow[700]},
      {'symbol': 'Cl', 'name': '塩素', 'color': Colors.green[300]},
      {'symbol': 'K', 'name': 'カリウム', 'color': Colors.purple[400]},
      {'symbol': 'Ca', 'name': 'カルシウム', 'color': Colors.green[700]},
      {'symbol': 'Fe', 'name': '鉄', 'color': Colors.brown[600]},
    ];

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: commonElements.length,
        itemBuilder: (context, index) {
          final element = commonElements[index];
          final isSelected = selectedElement == element['symbol'];
          final isNothingSelected = selectedElement == null;

          return GestureDetector(
            onTap: () {
              setState(() {
                // 同じ元素を再度タップした場合は選択解除
                if (selectedElement == element['symbol']) {
                  selectedElement = null;
                } else {
                  selectedElement = element['symbol'] as String;
                }
              });
            },
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : (isNothingSelected ? Colors.grey[100] : Colors.white),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.primaryDark : (isNothingSelected ? Colors.grey[400]! : Colors.grey[300]!),
                  width: isSelected ? 3 : 2,
                ),
                boxShadow: isSelected ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ] : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 原子のビジュアル表現
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: element['color'] as Color?,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        element['symbol'] as String,
                        style: TextStyle(
                          color: element['symbol'] == 'C' || element['symbol'] == 'S'
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    element['name'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.white : (isNothingSelected ? Colors.grey[600] : Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 結合タイプ選択
          _BondTypeButton(
            selectedBondType: selectedBondType,
            onBondTypeChanged: (bondType) {
              setState(() {
                selectedBondType = bondType;
              });
            },
          ),

          // 結合ヘルプ
          _ToolButton(
            icon: Icons.help_outline,
            label: 'つなぎ方',
            onTap: () => _showBondDialog(),
            color: Colors.blue,
          ),

          // 削除ツール（動的に変更）
          _ToolButton(
            icon: selectedAtom != null ? Icons.delete : Icons.delete_outline,
            label: selectedAtom != null ? 'げんしをけす' : 'すべてけす',
            onTap: selectedAtom != null ? () => _deleteAtom(selectedAtom!) : () => _clearCanvas(),
            color: Colors.red,
          ),

          // 選択解除ツール
          _ToolButton(
            icon: selectedElement == null ? Icons.radio_button_checked : Icons.radio_button_unchecked,
            label: selectedElement == null ? '選択なし' : '選択解除',
            onTap: () {
              setState(() {
                selectedElement = null;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('原子の選択を解除しました'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            color: selectedElement == null ? Colors.grey : Colors.orange,
          ),

          // チェックツール（構造の検証）
          _ToolButton(
            icon: Icons.check_circle_outline,
            label: 'しらべる',
            onTap: () => _validateMolecule(),
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  void _handleTap(Offset position) {
    // タップされた位置に原子があるかチェック
    Atom? tappedAtom;
    for (final atom in atoms) {
      if ((atom.position - position).distance < 30) {
        tappedAtom = atom;
        break;
      }
    }

    if (tappedAtom != null) {
      // 原子がタップされた場合
      if (selectedAtom == tappedAtom) {
        // 既に選択されている原子を再度タップした場合は削除
        _deleteAtom(tappedAtom);
      } else {
        // 原子を選択
        setState(() {
          selectedAtom = tappedAtom;
        });
      }
    } else {
      // 空の場所がタップされた場合
      if (selectedElement != null) {
        // 新しい原子を配置
        setState(() {
          selectedAtom = null; // 選択を解除
          atoms.add(Atom(
            element: selectedElement!,
            position: position,
            id: DateTime.now().millisecondsSinceEpoch.toString(),
          ));
        });
      } else {
        // 選択を解除
        setState(() {
          selectedAtom = null;
        });
      }
    }
  }

  void _deleteAtom(Atom atomToDelete) {
    setState(() {
      // 削除する原子に関連する結合を削除
      bonds.removeWhere((bond) =>
        bond.atom1 == atomToDelete || bond.atom2 == atomToDelete);

      // 原子を削除
      atoms.remove(atomToDelete);

      // 選択を解除
      selectedAtom = null;
    });
  }

  void _startDrag(Offset position) {
    // 近くの原子を探す
    for (final atom in atoms) {
      if ((atom.position - position).distance < 30) {
        setState(() {
          draggedAtom = atom;
          dragOffset = position;
          selectedAtom = atom; // ドラッグ開始時に選択
        });
        break;
      }
    }
  }

  void _updateDrag(Offset position) {
    if (draggedAtom != null) {
      setState(() {
        dragOffset = position;
      });
    }
  }

  void _endDrag() {
    if (draggedAtom != null && dragOffset != null) {
      bool bondCreated = false;

      // 別の原子の近くにドロップされたら結合を作成
      for (final atom in atoms) {
        if (atom != draggedAtom &&
            (atom.position - dragOffset!).distance < 50) {
          // 既存の結合があるかチェック
          final existingBondIndex = bonds.indexWhere((bond) =>
            (bond.atom1 == draggedAtom && bond.atom2 == atom) ||
            (bond.atom1 == atom && bond.atom2 == draggedAtom));

          setState(() {
            if (existingBondIndex != -1) {
              // 既存の結合がある場合は結合タイプを変更
              final existingBond = bonds[existingBondIndex];
              BondType newType;

              switch (existingBond.type) {
                case BondType.single:
                  newType = BondType.double;
                  break;
                case BondType.double:
                  newType = BondType.triple;
                  break;
                case BondType.triple:
                  newType = BondType.single; // ループして単結合に戻る
                  break;
              }

              bonds[existingBondIndex] = Bond(
                atom1: existingBond.atom1,
                atom2: existingBond.atom2,
                type: newType,
              );
            } else {
              // 新しい結合を作成
              bonds.add(Bond(
                atom1: draggedAtom!,
                atom2: atom,
                type: selectedBondType,
              ));
            }
          });
          bondCreated = true;
          break;
        }
      }

      // 結合が作成されなかった場合のみ、原子の位置を最終的なドラッグ位置に更新
      if (!bondCreated) {
        setState(() {
          draggedAtom!.position = dragOffset!;
        });
      }
      // 結合が作成された場合は、原子は元の位置に戻る（何もしない）
    }

    setState(() {
      draggedAtom = null;
      dragOffset = null;
    });
  }

  void _showBondDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('結合をつくろう！'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('💡 結合の作り方:'),
            SizedBox(height: 8),
            Text('1. 結合タイプを選ぶ（単結合/二重結合/三重結合）'),
            Text('2. 原子を別の原子にドラッグする'),
            Text('3. 既存の結合をドラッグして結合タイプを変更'),
            SizedBox(height: 12),
            Text('⚡ 結合の種類:'),
            Text('• 単結合 ─ （例：C-H）'),
            Text('• 二重結合 ═ （例：C=O）'),
            Text('• 三重結合 ≡ （例：C≡N）'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('わかった！'),
          ),
        ],
      ),
    );
  }

  void _clearCanvas() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('すべて消去'),
        content: const Text('すべての原子と結合を消してもよろしいですか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                atoms.clear();
                bonds.clear();
              });
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('すべて消す'),
          ),
        ],
      ),
    );
  }

  void _validateMolecule() async {
    if (atoms.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('原子を配置してから検証してください'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // ローディングダイアログを表示
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        title: Text('分子をしらべています...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('この分子が本当に存在するか調べています'),
          ],
        ),
      ),
    );

    try {
      // 原子と結合のデータをAPI形式に変換
      final atomsData = atoms.map((atom) => {
        'id': atom.id,
        'element': atom.element,
        'position': {
          'x': atom.position.dx,
          'y': atom.position.dy,
        },
      }).toList();

      final bondsData = bonds.map((bond) => {
        'atom1Id': bond.atom1.id,
        'atom2Id': bond.atom2.id,
        'type': bond.type.name,
      }).toList();

      // 構造を検証
      final validationResult = await ApiService.validateMolecule(
        atoms: atomsData,
        bonds: bondsData,
      );

      // 分子式を生成
      final formula = _generateMolecularFormula();

      Map<String, dynamic>? searchResult;
      if (formula.isNotEmpty) {
        try {
          searchResult = await ApiService.searchByFormula(formula);
        } catch (e) {
          // 検索が失敗した場合は空の結果を設定
          searchResult = {
            'found': false,
            'message': '検索中にエラーが発生しました',
            'compounds': [],
          };
        }
      } else {
        // 分子式が空の場合
        searchResult = {
          'found': false,
          'message': '分子式を生成できませんでした',
          'compounds': [],
        };
      }

      // ローディングダイアログを閉じる
      if (mounted) Navigator.of(context).pop();

      // 結果を表示
      _showValidationResult(validationResult, searchResult, formula);

    } catch (e) {
      // ローディングダイアログを閉じる
      if (mounted) Navigator.of(context).pop();

      // エラーメッセージを表示
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('エラーが発生しました: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _generateMolecularFormula() {
    final Map<String, int> elementCounts = {};

    for (final atom in atoms) {
      elementCounts[atom.element] = (elementCounts[atom.element] ?? 0) + 1;
    }

    if (elementCounts.isEmpty) return '';

    // 化学式の標準的な命名規則に従う
    final List<String> orderedElements = [];

    if (elementCounts.containsKey('C')) {
      // 有機化合物：C、H、その他をアルファベット順
      orderedElements.add('C');
      if (elementCounts.containsKey('H')) orderedElements.add('H');

      final otherElements = elementCounts.keys
          .where((e) => e != 'C' && e != 'H')
          .toList()
        ..sort();
      orderedElements.addAll(otherElements);
    } else {
      // 無機化合物：特定の順序規則を適用
      final Set<String> elements = elementCounts.keys.toSet();

      // 硫酸系化合物（H2SO4）
      if (elements.containsAll(['H', 'S', 'O'])) {
        orderedElements.addAll(['H', 'S', 'O']);
      }
      // 硝酸系化合物（HNO3）
      else if (elements.containsAll(['H', 'N', 'O'])) {
        orderedElements.addAll(['H', 'N', 'O']);
      }
      // 塩酸系化合物（HCl）
      else if (elements.containsAll(['H', 'Cl'])) {
        orderedElements.addAll(['H', 'Cl']);
      }
      // リン酸系化合物（H3PO4）
      else if (elements.containsAll(['H', 'P', 'O'])) {
        orderedElements.addAll(['H', 'P', 'O']);
      }
      // 水酸化ナトリウム（NaOH）
      else if (elements.containsAll(['Na', 'O', 'H'])) {
        orderedElements.addAll(['Na', 'O', 'H']);
      }
      // 水酸化カルシウム（Ca(OH)2 → CaH2O2）
      else if (elements.containsAll(['Ca', 'O', 'H'])) {
        orderedElements.addAll(['Ca', 'H', 'O']);
      }
      // アンモニア（NH3）
      else if (elements.containsAll(['N', 'H']) && elements.length == 2) {
        orderedElements.addAll(['N', 'H']);
      }
      // 水（H2O）
      else if (elements.containsAll(['H', 'O']) && elements.length == 2) {
        orderedElements.addAll(['H', 'O']);
      }
      // 過酸化水素（H2O2）
      else if (elements.containsAll(['H', 'O']) &&
               elementCounts['H']! >= 2 && elementCounts['O']! >= 2) {
        orderedElements.addAll(['H', 'O']);
      }
      // 塩化ナトリウム（NaCl）
      else if (elements.containsAll(['Na', 'Cl'])) {
        orderedElements.addAll(['Na', 'Cl']);
      }
      // 塩化カルシウム（CaCl2）
      else if (elements.containsAll(['Ca', 'Cl'])) {
        orderedElements.addAll(['Ca', 'Cl']);
      }
      // 塩化マグネシウム（MgCl2）
      else if (elements.containsAll(['Mg', 'Cl'])) {
        orderedElements.addAll(['Mg', 'Cl']);
      }
      // 硫酸ナトリウム（Na2SO4）
      else if (elements.containsAll(['Na', 'S', 'O'])) {
        orderedElements.addAll(['Na', 'S', 'O']);
      }
      // 硫酸カルシウム（CaSO4）
      else if (elements.containsAll(['Ca', 'S', 'O'])) {
        orderedElements.addAll(['Ca', 'S', 'O']);
      }
      // 硫酸マグネシウム（MgSO4）
      else if (elements.containsAll(['Mg', 'S', 'O'])) {
        orderedElements.addAll(['Mg', 'S', 'O']);
      }
      // 酸化物系：金属 + O
      else if (elements.contains('O')) {
        final metals = ['Na', 'Ca', 'Mg', 'Al', 'K', 'Fe', 'Cu', 'Zn'];
        final metalInFormula = elements.firstWhere(
          (e) => metals.contains(e),
          orElse: () => ''
        );
        if (metalInFormula.isNotEmpty) {
          orderedElements.add(metalInFormula);
          orderedElements.add('O');
          // 他の元素があれば追加
          final remainingElements = elements
              .where((e) => e != metalInFormula && e != 'O')
              .toList()
            ..sort();
          orderedElements.addAll(remainingElements);
        } else {
          // 一般的な順序：アルファベット順だが、水素は最初
          if (elements.contains('H')) {
            orderedElements.add('H');
            final nonHydrogenElements = elements
                .where((e) => e != 'H')
                .toList()
              ..sort();
            orderedElements.addAll(nonHydrogenElements);
          } else {
            final allElements = elements.toList()..sort();
            orderedElements.addAll(allElements);
          }
        }
      }
      // その他の一般的な化合物：水素がある場合は最初、その他はアルファベット順
      else {
        if (elements.contains('H')) {
          orderedElements.add('H');
          final nonHydrogenElements = elements
              .where((e) => e != 'H')
              .toList()
            ..sort();
          orderedElements.addAll(nonHydrogenElements);
        } else {
          final allElements = elements.toList()..sort();
          orderedElements.addAll(allElements);
        }
      }
    }

    String formula = '';
    for (final element in orderedElements) {
      final count = elementCounts[element]!;
      formula += element;
      if (count > 1) {
        formula += count.toString();
      }
    }

    return formula;
  }

  void _showValidationResult(Map<String, dynamic> validationResult, Map<String, dynamic>? searchResult, String formula) {
    final bool isValid = validationResult['isValid'] ?? false;
    final List<String> issues = List<String>.from(validationResult['issues'] ?? []);
    final String suggestion = validationResult['suggestion'] ?? '';

    final bool foundCompounds = searchResult?['found'] ?? false;
    final List<dynamic> compounds = searchResult?['compounds'] ?? [];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              isValid ? Icons.check_circle : Icons.warning,
              color: isValid ? Colors.green : Colors.orange,
              size: 28,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                isValid ? '構造は正しいです！' : '構造に問題があります',
                style: TextStyle(
                  color: isValid ? Colors.green : Colors.orange,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (formula.isNotEmpty) ...[
                Text('🧪 分子式: $formula',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
              ],

              if (!isValid && issues.isNotEmpty) ...[
                const Text('⚠️ 問題点:',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                const SizedBox(height: 4),
                ...issues.map((issue) => Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 4),
                  child: Text('• $issue'),
                )),
                const SizedBox(height: 8),
                Text('💡 $suggestion'),
                const SizedBox(height: 12),
              ],

              // 化合物検索結果の表示
              if (formula.isNotEmpty) ...[
                const SizedBox(height: 8),
                if (foundCompounds && compounds.isNotEmpty) ...[
                  const Text('実在する化合物が見つかりました！',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                  const SizedBox(height: 8),
                  ...compounds.take(3).map((compound) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(compound['name'] ?? '不明',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
                ] else if (isValid) ...[
                  // 構造は正しいが化合物が見つからない場合
                  const Text('🔍 この分子式の化合物はデータベースで見つかりませんでした',
                    style: TextStyle(color: Colors.orange)),
                  const SizedBox(height: 4),
                  const Text('珍しい化合物か、新しい化合物を発見したかもしれません！',
                    style: TextStyle(color: Colors.blue)),
                ] else ...[
                  // 構造に問題がある場合
                  const Text('💡 構造を修正してから再度検索してみてください',
                    style: TextStyle(color: Colors.grey)),
                ],
              ] else ...[
                const Text('⚠️ 分子式を生成できませんでした',
                  style: TextStyle(color: Colors.red)),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('閉じる'),
          ),
          if (isValid)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _show3DModel();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text('3Dで見る'),
            ),
        ],
      ),
    );
  }

  void _show3DModel() async {
    if (atoms.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('原子を配置してから使用してください'),
        ),
      );
      return;
    }

    final formula = _generateMolecularFormula();
    if (formula.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('分子式を生成できませんでした'),
        ),
      );
      return;
    }

    // ローディングダイアログを表示
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('3Dモデルを準備中...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('分子式: $formula'),
            const SizedBox(height: 8),
            const Text('3Dモデルを構築中...'),
          ],
        ),
      ),
    );

    try {
      // 分子式から3Dデータを取得
      final result = await ApiService.get3DDataByFormula(formula);

      // ローディングダイアログを閉じる
      if (mounted) Navigator.of(context).pop();

      if (result['success'] == true && result['data'] != null) {
        final data = result['data'];

        // Base64GLBデータからSDFデータを使用してModelViewerScreenに遷移
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ModelViewerScreen(
                sdfData: data['sdf'],
                moleculeName: data['moleculeName'] ?? formula,
                formula: formula,
                originalImageUrl: null, // 構築した分子なので元画像はなし
              ),
            ),
          );
        }
      } else {
        // 3Dデータが見つからない場合
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('3D表示できません'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('分子式: $formula'),
                  const SizedBox(height: 12),
                  Text(result['message'] ?? 'この分子の3Dデータが見つかりませんでした'),
                  const SizedBox(height: 12),
                  const Text('考えられる原因:'),
                  const Text('• 存在しない化合物の可能性'),
                  const Text('• データベースに登録されていない'),
                  const Text('• 分子構造に問題がある'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('閉じる'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _validateMolecule(); // 構造検証を実行
                  },
                  child: const Text('構造を確認する'),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      // ローディングダイアログを閉じる
      if (mounted) Navigator.of(context).pop();

      // エラーメッセージを表示
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('3Dデータの取得に失敗しました: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }
}

// データモデル
class Atom {
  final String element;
  Offset position;
  final String id;

  Atom({
    required this.element,
    required this.position,
    required this.id,
  });
}

class Bond {
  final Atom atom1;
  final Atom atom2;
  final BondType type;

  Bond({
    required this.atom1,
    required this.atom2,
    required this.type,
  });
}

enum BondType { single, double, triple }

// カスタムペインター
class MoleculePainter extends CustomPainter {
  final List<Atom> atoms;
  final List<Bond> bonds;
  final Atom? draggedAtom;
  final Offset? dragOffset;
  final Atom? selectedAtom;

  MoleculePainter({
    required this.atoms,
    required this.bonds,
    this.draggedAtom,
    this.dragOffset,
    this.selectedAtom,
  });

  void _drawBond(Canvas canvas, Bond bond, Paint paint) {
    final start = bond.atom1.position;
    final end = bond.atom2.position;

    switch (bond.type) {
      case BondType.single:
        canvas.drawLine(start, end, paint);
        break;

      case BondType.double:
        // 2重結合：平行な2本の線
        final direction = end - start;
        final length = direction.distance;
        final unitDirection = direction / length;
        final perpendicular = Offset(-unitDirection.dy, unitDirection.dx) * 3;

        canvas.drawLine(start + perpendicular, end + perpendicular, paint);
        canvas.drawLine(start - perpendicular, end - perpendicular, paint);
        break;

      case BondType.triple:
        // 3重結合：中央1本 + 平行2本
        final direction = end - start;
        final length = direction.distance;
        final unitDirection = direction / length;
        final perpendicular = Offset(-unitDirection.dy, unitDirection.dx) * 4;

        canvas.drawLine(start, end, paint); // 中央
        canvas.drawLine(start + perpendicular, end + perpendicular, paint);
        canvas.drawLine(start - perpendicular, end - perpendicular, paint);
        break;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final bondPaint = Paint()
      ..color = Colors.grey[600]!
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // 結合を描画
    for (final bond in bonds) {
      _drawBond(canvas, bond, bondPaint);
    }

    // 原子を描画
    for (final atom in atoms) {
      final position = (draggedAtom == atom && dragOffset != null)
          ? dragOffset!
          : atom.position;

      final atomPaint = Paint()
        ..color = _getElementColor(atom.element)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(position, 25, atomPaint);

      // 選択されている原子には外枠を描画
      if (selectedAtom == atom) {
        final selectionPaint = Paint()
          ..color = Colors.orange
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;
        canvas.drawCircle(position, 30, selectionPaint);
      }

      // 元素記号
      final textPainter = TextPainter(
        text: TextSpan(
          text: atom.element,
          style: TextStyle(
            color: atom.element == 'C' ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(
        canvas,
        position - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }
  }

  Color _getElementColor(String element) {
    switch (element) {
      case 'H': return Colors.white;
      case 'C': return Colors.grey[800]!;
      case 'N': return Colors.blue;
      case 'O': return Colors.red;
      case 'F': return Colors.green;
      case 'Na': return Colors.purple[300]!;
      case 'Si': return Colors.brown[300]!;
      case 'P': return Colors.orange;
      case 'S': return Colors.yellow[700]!;
      case 'Cl': return Colors.green[300]!;
      case 'K': return Colors.purple[400]!;
      case 'Ca': return Colors.green[700]!;
      case 'Fe': return Colors.brown[600]!;
      default: return Colors.grey;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// グリッド描画
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[200]!
      ..strokeWidth = 1;

    const gridSize = 20.0;

    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 結合タイプ選択ボタン
class _BondTypeButton extends StatelessWidget {
  final BondType selectedBondType;
  final ValueChanged<BondType> onBondTypeChanged;

  const _BondTypeButton({
    required this.selectedBondType,
    required this.onBondTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildBondIcon(BondType.single),
              const SizedBox(width: 4),
              _buildBondIcon(BondType.double),
              const SizedBox(width: 4),
              _buildBondIcon(BondType.triple),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            _getBondTypeLabel(selectedBondType),
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBondIcon(BondType bondType) {
    final isSelected = selectedBondType == bondType;
    return GestureDetector(
      onTap: () => onBondTypeChanged(bondType),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
          child: CustomPaint(
            size: const Size(12, 12),
            painter: BondIconPainter(bondType, isSelected),
          ),
        ),
      ),
    );
  }

  String _getBondTypeLabel(BondType bondType) {
    switch (bondType) {
      case BondType.single:
        return '単結合';
      case BondType.double:
        return '二重結合';
      case BondType.triple:
        return '三重結合';
    }
  }
}

// 結合アイコン描画
class BondIconPainter extends CustomPainter {
  final BondType bondType;
  final bool isSelected;

  BondIconPainter(this.bondType, this.isSelected);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isSelected ? Colors.white : Colors.blue
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final start = Offset(2, size.height / 2);
    final end = Offset(size.width - 2, size.height / 2);

    switch (bondType) {
      case BondType.single:
        canvas.drawLine(start, end, paint);
        break;
      case BondType.double:
        canvas.drawLine(
          Offset(start.dx, start.dy - 1.5),
          Offset(end.dx, end.dy - 1.5),
          paint,
        );
        canvas.drawLine(
          Offset(start.dx, start.dy + 1.5),
          Offset(end.dx, end.dy + 1.5),
          paint,
        );
        break;
      case BondType.triple:
        canvas.drawLine(start, end, paint);
        canvas.drawLine(
          Offset(start.dx, start.dy - 2),
          Offset(end.dx, end.dy - 2),
          paint,
        );
        canvas.drawLine(
          Offset(start.dx, start.dy + 2),
          Offset(end.dx, end.dy + 2),
          paint,
        );
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ツールボタン
class _ToolButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _ToolButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.3),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}