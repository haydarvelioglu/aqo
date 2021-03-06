*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
REPORT zaqo_load_2_smw0.

PARAMETERS:
 p_path TYPE string OBLIGATORY.

PERFORM start.

FORM start.
  PERFORM load USING  'Z_AQO_I18N_EN_JSON'    'json\i18n_en.json'.
  PERFORM load USING  'Z_AQO_I18N_RU_JSON'    'json\i18n_ru.json'.
  PERFORM load USING  'Z_AQO_INDEX_HTML'      'index.html'.
  PERFORM load USING  'Z_AQO_START_DIALOG_JS' 'start_dialog.js'.
  PERFORM load USING  'Z_AQO_USAGE_JS'        'usage.js'.
  PERFORM load USING  'Z_AQO_UTIL_JS'         'util.js'.

  MESSAGE 'Done' TYPE 'S'.
ENDFORM.

FORM load USING iv_objid    TYPE wwwdata-objid
                iv_rel_path TYPE csequence.
  DATA:
    lv_path TYPE text255,
    ls_key  TYPE wwwdatatab.

  CONCATENATE p_path iv_rel_path INTO lv_path.
  ls_key-relid = 'MI'.
  ls_key-objid = iv_objid.

  CALL FUNCTION 'UPLOAD_WEB_OBJECT'
    EXPORTING
      key  = ls_key
      temp = lv_path.
ENDFORM.
