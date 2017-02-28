<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:f="myfunctions"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="f"><!--true-->
   <xsl:variable name="projectpath"
                 select="'D:\All-SIL-Publishing\github-SILAsiaPub\vimod-pub-solo-sfm2lift\trunk'"/>
   <xsl:variable name="cd"
                 select="'D:\All-SIL-Publishing\github-SILAsiaPub\vimod-pub-solo-sfm2lift\trunk'"/>
   <xsl:variable name="sq">'</xsl:variable>
   <xsl:variable name="dq">"</xsl:variable>
   <xsl:variable name="pubpath"
                 select="'D:\All-SIL-Publishing\github-SILAsiaPub\vimod-pub-solo-sfm2lift\trunk'"/>
   <xsl:variable name="true" select="tokenize('true yes on 1','\s+')"/>
   <xsl:variable name="comment1"
                 select="'# =================================================================='"/>
   <xsl:variable name="comment2" select="'# dict2web project variables'"/>
   <xsl:variable name="comment3" select="'# 2014-10-24'"/>
   <xsl:variable name="comment4"
                 select="'# you don t have to edit the line below but you should'"/>
   <xsl:variable name="comment5">variable                                </xsl:variable>
   <xsl:param name="iso" select="'xxx'"/>
   <xsl:variable name="comment6"
                 select="'# If your source is not UTF8 you must supply this variable'"/>
   <xsl:variable name="comment7">variable                                </xsl:variable>
   <xsl:param name="source-sfm-legacy"
              select="concat($projectpath,'\source\source.sfm')"/>
   <xsl:variable name="comment8"
                 select="'# If your source file is UTF8 start here. Change %iso%-utf8.sfm to the name of your file and put it in the source directory'"/>
   <xsl:variable name="comment9">variable                                </xsl:variable>
   <xsl:param name="source-sfm-utf8"
              select="concat($projectpath,'\source\',$iso,'-utf8.sfm')"/>
   <xsl:variable name="comment10" select="'# Don t edit this next line'"/>
   <xsl:variable name="comment11">variable                                </xsl:variable>
   <xsl:param name="xmlsource" select="concat($projectpath,'\source\',$iso,'.xml')"/>
   <xsl:variable name="comment13" select="'# Structure variables'"/>
   <xsl:variable name="comment14">remove if empty                         </xsl:variable>
   <xsl:param name="removeempty_list" select="'de dn dr ge gn xv xn xe xr rf'"/>
   <xsl:variable name="removeempty" select="tokenize($removeempty_list,'\s+')"/>
   <xsl:variable name="comment15">remove if empty exceptions              </xsl:variable>
   <xsl:param name="except_list" select="'se'"/>
   <xsl:variable name="except" select="tokenize($except_list,'\s+')"/>
   <xsl:variable name="comment17" select="'# xml structure variables'"/>
   <xsl:variable name="comment18">fields_to_remove                        </xsl:variable>
   <xsl:param name="fields-to-remove" select="'dt dl cet cm gm rf'"/>
   <xsl:variable name="comment19">elements to rename                      </xsl:variable>
   <xsl:param name="element-rename_list" select="'lont=lx2'"/>
   <xsl:variable name="element-rename" select="tokenize($element-rename_list,'\s+')"/>
   <xsl:variable name="element-rename-key"
                 select="tokenize($element-rename_list,'=[^\s]+\s?')"/>
   <xsl:variable name="comment20">remove if empty                         </xsl:variable>
   <xsl:param name="remove-empty_list" select="'de dn dr ge gn xv xn xe xr rf'"/>
   <xsl:variable name="remove-empty" select="tokenize($remove-empty_list,'\s+')"/>
   <xsl:variable name="comment21">remove if empty exceptions              </xsl:variable>
   <xsl:param name="remove-except_list" select="'se ps'"/>
   <xsl:variable name="remove-except" select="tokenize($remove-except_list,'\s+')"/>
   <xsl:variable name="comment22">example nodes                           </xsl:variable>
   <xsl:param name="example-node_list" select="'xv xn xe xr'"/>
   <xsl:variable name="example-node" select="tokenize($example-node_list,'\s+')"/>
   <xsl:variable name="comment23">out of place nodes                      </xsl:variable>
   <xsl:param name="out-of-place-node_list" select="'lf lv'"/>
   <xsl:variable name="out-of-place-node"
                 select="tokenize($out-of-place-node_list,'\s+')"/>
   <xsl:variable name="comment24">definition nodes                        </xsl:variable>
   <xsl:param name="definition-node_list" select="'dn de dr'"/>
   <xsl:variable name="definition-node" select="tokenize($definition-node_list,'\s+')"/>
   <xsl:variable name="comment25">reorder nodes                           </xsl:variable>
   <xsl:param name="reorder-node_list" select="'lx2 hm'"/>
   <xsl:variable name="reorder-node" select="tokenize($reorder-node_list,'\s+')"/>
   <xsl:variable name="comment26">pos node sn or ps                       </xsl:variable>
   <xsl:param name="pos-node" select="'sn'"/>
   <xsl:variable name="comment28" select="'# sfm2LIFT variables'"/>
   <xsl:variable name="comment29">lexical node list                       </xsl:variable>
   <xsl:param name="lexical-node_list" select="'lx lx2 se'"/>
   <xsl:variable name="lexical-node" select="tokenize($lexical-node_list,'\s+')"/>
   <xsl:variable name="comment30">subentry group node                     </xsl:variable>
   <xsl:param name="subentry-group-node" select="'seGroup'"/>
   <xsl:variable name="comment31">variant node list                       </xsl:variable>
   <xsl:param name="variant-node_list" select="'va'"/>
   <xsl:variable name="variant-node" select="tokenize($variant-node_list,'\s+')"/>
   <xsl:variable name="comment32">example group                           </xsl:variable>
   <xsl:param name="example-group-node_list" select="'xvGroup exGroup'"/>
   <xsl:variable name="example-group-node"
                 select="tokenize($example-group-node_list,'\s+')"/>
   <xsl:variable name="comment33">example-vern-node                       </xsl:variable>
   <xsl:param name="example-vern-node" select="'xv'"/>
   <xsl:variable name="comment34">Englisn lang name in other lang         </xsl:variable>
   <xsl:param name="eng-lang-name_underscore-list"
              select="'en=English_fr=Anglais_es=Inglés_pt=Inglês_bg=английски_rw=Icyongereza_id=Bahasa Inggris_zh-CHT=英文_zh-CHS=英文_km=?អង់គ្លេស'"/>
   <xsl:variable name="eng-lang-name"
                 select="tokenize($eng-lang-name_underscore-list,'_')"/>
   <xsl:variable name="eng-lang-name-key"
                 select="tokenize($eng-lang-name_underscore-list,'=[^_]+_?')"/>
   <xsl:variable name="comment35">example translation node                </xsl:variable>
   <xsl:param name="example-trans-node_list" select="'xn xe xr'"/>
   <xsl:variable name="example-trans-node"
                 select="tokenize($example-trans-node_list,'\s+')"/>
   <xsl:variable name="comment36">non-Eng lang array                      </xsl:variable>
   <xsl:param name="non-eng-lang_list"
              select="'id=Indonesian mak=Mangkasara bug=Buginese'"/>
   <xsl:variable name="non-eng-lang" select="tokenize($non-eng-lang_list,'\s+')"/>
   <xsl:variable name="non-eng-lang-key"
                 select="tokenize($non-eng-lang_list,'=[^\s]+\s?')"/>
   <xsl:variable name="comment37">key values array                        </xsl:variable>
   <xsl:param name="element-lang_list"
              select="'gn=id ge=en de=en dn=id va=mak lx2=bug bw=id cf=mak lx=mak lv=id nt=en ps=id se=mak xv=mak xn=id xe=en xr=xx '"/>
   <xsl:variable name="element-lang" select="tokenize($element-lang_list,'\s+')"/>
   <xsl:variable name="element-lang-key"
                 select="tokenize($element-lang_list,'=[^\s]+\s?')"/>
   <xsl:variable name="comment38">key value array source lang             </xsl:variable>
   <xsl:param name="note-value-substitute_underscore-list"
              select="'Arb=bahasa Arab_Ark=arkais/purba_Ark.=arkais/purba_BI=bahasa Indonesia_DT=Belanda (Dutch)_Tur=Turatea_KJ=Konjo'"/>
   <xsl:variable name="note-value-substitute"
                 select="tokenize($note-value-substitute_underscore-list,'_')"/>
   <xsl:variable name="note-value-substitute-key"
                 select="tokenize($note-value-substitute_underscore-list,'=[^_]+_?')"/>
   <xsl:variable name="comment39">pos group                               </xsl:variable>
   <xsl:param name="pos-group-node_list" select="'snGroup psGroup'"/>
   <xsl:variable name="pos-group-node" select="tokenize($pos-group-node_list,'\s+')"/>
   <xsl:variable name="comment40">list of form elements                   </xsl:variable>
   <xsl:param name="form-element_list" select="'lx lx2 va xv xn xe xr se dn de dr'"/>
   <xsl:variable name="form-element" select="tokenize($form-element_list,'\s+')"/>
   <xsl:variable name="comment41">list of gloss elements                  </xsl:variable>
   <xsl:param name="gloss-element_list" select="'ge gn gr'"/>
   <xsl:variable name="gloss-element" select="tokenize($gloss-element_list,'\s+')"/>
   <xsl:variable name="comment42">list of definition group elements       </xsl:variable>
   <xsl:param name="definition-group-element_list" select="'deGroup dnGroup drGroup'"/>
   <xsl:variable name="definition-group-element"
                 select="tokenize($definition-group-element_list,'\s+')"/>
   <xsl:variable name="comment43">list of note elements                   </xsl:variable>
   <xsl:param name="note-element_list"
              select="'nt=general na=anthropology nd=discourse ng=grammar np=phonology nq=questions ns=sociolinguistics mr=morphology bw=asal'"/>
   <xsl:variable name="note-element" select="tokenize($note-element_list,'\s+')"/>
   <xsl:variable name="note-element-key"
                 select="tokenize($note-element_list,'=[^\s]+\s?')"/>
   <xsl:variable name="comment44">key values array of relations           </xsl:variable>
   <xsl:param name="relation-element_list" select="'cf=lih sy=synonym an=antonym'"/>
   <xsl:variable name="relation-element" select="tokenize($relation-element_list,'\s+')"/>
   <xsl:variable name="relation-element-key"
                 select="tokenize($relation-element_list,'=[^\s]+\s?')"/>
   <xsl:variable name="comment45">key value array of part of speach       </xsl:variable>
   <xsl:param name="pos-value-substitute_underscore-list"
              select="'adj=adjektif_adv=adverba_Asal=asal kata_clf=klasifikator_det=determinator_dir=direksi_kasar=bicara kasar, kotor_konfiks=konfiks_konj=konjungsi_ksapa=kata sapa_kseru=kata seru_lihat=lihat_mode=modalitas_n=nomina_nama=nama orang, kota_num=nomor_p=preposisi_POS=posesif_pp=frase preposisi_pref=prefiks_pron=pronoina, permarkah persona_quan=quantitas_suf=sufiks_v=verba_Var.=varian_v, ki=verba, ki_num clf=nomor, klasifikator'"/>
   <xsl:variable name="pos-value-substitute"
                 select="tokenize($pos-value-substitute_underscore-list,'_')"/>
   <xsl:variable name="pos-value-substitute-key"
                 select="tokenize($pos-value-substitute_underscore-list,'=[^_]+_?')"/>
   <xsl:variable name="comment46">groups not in psGroup but need it forDAB</xsl:variable>
   <xsl:param name="groups2sudo-pos_list" select="'bwGroup lfGroup'"/>
   <xsl:variable name="groups2sudo-pos" select="tokenize($groups2sudo-pos_list,'\s+')"/>
   <xsl:variable name="comment47">main grouping                           </xsl:variable>
   <xsl:param name="top-level-node_list" select="'snGroup seGroup lf va bw cf'"/>
   <xsl:variable name="top-level-node" select="tokenize($top-level-node_list,'\s+')"/>
   <xsl:variable name="comment48">second grouping                         </xsl:variable>
   <xsl:param name="second-level-node_list" select="'snGroup lf va bw cf xvGroup'"/>
   <xsl:variable name="second-level-node"
                 select="tokenize($second-level-node_list,'\s+')"/>
   <xsl:variable name="comment49"
                 select="'#post variant-node                       ;var post-variable-node_list &#34;snGroup lfGroup bw xvGroup cf&#34;'"/>
   <xsl:variable name="comment50"
                 select="'#post variant-node                       ;var post-gloss-in-posgroup_list &#34;snGroup lfGroup bw xvGroup cf&#34;'"/>
   <xsl:variable name="comment51"
                 select="'make project xslt                       ;projectxslt'"/>
</xsl:stylesheet>
