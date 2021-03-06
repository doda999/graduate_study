CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --master_port 10027 --nproc_per_node=1 \
tools/relation_test_net.py \
--config-file "configs/e2e_relation_X_101_32_8_FPN_1x.yaml" \
MODEL.ROI_RELATION_HEAD.USE_GT_BOX True \
MODEL.ROI_RELATION_HEAD.USE_GT_OBJECT_LABEL True \
MODEL.ROI_RELATION_HEAD.PREDICTOR  CausalPSKTPredictor \
MODEL.ROI_RELATION_HEAD.CONTEXT_HIDDEN_DIM  512 \
MODEL.ROI_RELATION_HEAD.CAUSALPSKT.CONTEXT_LAYER motifs \
MODEL.ROI_RELATION_HEAD.CAUSALPSKT.KNOWLEDGE_TRANSFER True \
MODEL.ROI_RELATION_HEAD.CAUSALPSKT.SPATIAL_FOR_VISION True \
MODEL.ROI_RELATION_HEAD.CAUSALPSKT.SEPARATE_SPATIAL False \
MODEL.ROI_RELATION_HEAD.CAUSALPSKT.EFFECT_ANALYSIS True \
MODEL.ROI_RELATION_HEAD.CAUSALPSKT.EFFECT_TYPE TDE \
TEST.IMS_PER_BATCH 1 \
DTYPE "float16" \
OUTPUT_DIR [path to the directory including your model] \
MODEL.ROI_RELATION_HEAD.CAUSALPSKT.TAXONOMY_PATH [path to taxonomy file]
