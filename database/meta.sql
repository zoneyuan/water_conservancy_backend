PGDMP     %                    z            meta    13.3    13.3     )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ,           1262    24576    meta    DATABASE     l   CREATE DATABASE meta WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Chinese (Simplified)_China.936';
    DROP DATABASE meta;
                postgres    false                        3079    26696    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                   false            -           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                        false    2            �            1259    27711    metadata    TABLE     ~  CREATE TABLE public.metadata (
    data_id integer NOT NULL,
    data_name text,
    data_type text,
    data_time text,
    data_scale text,
    data_coord text,
    data_url text,
    data_layer_name text,
    minlat double precision,
    maxlat double precision,
    minlon double precision,
    maxlon double precision,
    project_id integer,
    city text,
    county text
);
    DROP TABLE public.metadata;
       public         heap    postgres    false            �            1259    27717    metadata_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metadata_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.metadata_data_id_seq;
       public          postgres    false    206            .           0    0    metadata_data_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.metadata_data_id_seq OWNED BY public.metadata.data_id;
          public          postgres    false    207            �            1259    41738    projectinfo    TABLE       CREATE TABLE public.projectinfo (
    project_id integer NOT NULL,
    project_name text,
    project_time text,
    project_description text,
    project_data text,
    project_img text,
    project_position text,
    project_area integer,
    project_leader text
);
    DROP TABLE public.projectinfo;
       public         heap    postgres    false            �            1259    27719    userinfo    TABLE     �   CREATE TABLE public.userinfo (
    user_id integer NOT NULL,
    user_name text NOT NULL,
    password text NOT NULL,
    user_type text NOT NULL
);
    DROP TABLE public.userinfo;
       public         heap    postgres    false            �            1259    27725    user_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    208            /           0    0    user_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_user_id_seq OWNED BY public.userinfo.user_id;
          public          postgres    false    209            �           2604    27727    metadata data_id    DEFAULT     t   ALTER TABLE ONLY public.metadata ALTER COLUMN data_id SET DEFAULT nextval('public.metadata_data_id_seq'::regclass);
 ?   ALTER TABLE public.metadata ALTER COLUMN data_id DROP DEFAULT;
       public          postgres    false    207    206            �           2604    27728    userinfo user_id    DEFAULT     p   ALTER TABLE ONLY public.userinfo ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);
 ?   ALTER TABLE public.userinfo ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    209    208            "          0    27711    metadata 
   TABLE DATA           �   COPY public.metadata (data_id, data_name, data_type, data_time, data_scale, data_coord, data_url, data_layer_name, minlat, maxlat, minlon, maxlon, project_id, city, county) FROM stdin;
    public          postgres    false    206   �       &          0    41738    projectinfo 
   TABLE DATA           �   COPY public.projectinfo (project_id, project_name, project_time, project_description, project_data, project_img, project_position, project_area, project_leader) FROM stdin;
    public          postgres    false    210   �i       �          0    27003    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          postgres    false    202   -j       $          0    27719    userinfo 
   TABLE DATA           K   COPY public.userinfo (user_id, user_name, password, user_type) FROM stdin;
    public          postgres    false    208   Jj       0           0    0    metadata_data_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.metadata_data_id_seq', 1000, true);
          public          postgres    false    207            1           0    0    user_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_user_id_seq', 2, true);
          public          postgres    false    209            �           2606    27730    metadata metadata_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (data_id);
 @   ALTER TABLE ONLY public.metadata DROP CONSTRAINT metadata_pkey;
       public            postgres    false    206            �           2606    41745    projectinfo projectinfo_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.projectinfo
    ADD CONSTRAINT projectinfo_pkey PRIMARY KEY (project_id);
 F   ALTER TABLE ONLY public.projectinfo DROP CONSTRAINT projectinfo_pkey;
       public            postgres    false    210            �           2606    27732    userinfo user_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT user_pkey;
       public            postgres    false    208            �           2606    41746    metadata project_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT project_id FOREIGN KEY (project_id) REFERENCES public.projectinfo(project_id) NOT VALID;
 =   ALTER TABLE ONLY public.metadata DROP CONSTRAINT project_id;
       public          postgres    false    206    210    3737            "      x�ݽَ׵&|M?�n�;FdFa@h�s�6��m�w�����y�+REq*R�Ae��d��(���TfU�E��]�)B縒�*c����Z���l6>�|�p����k����|�z����载+�oEr����/I� 5SG�Ajv`���h4:��M)���13��a���$MG�L�	��1#fD��$?�|�?�@�,�I���F���{�S�9�cbD���%/����?J�$.�|��0s��p��A����[�iY���[\Z�G���l���n���-.��s]S�|�o�?�/R|����?������Гс���,O_\]:������T��_X�zA(������1ˎ���S0'��?s~�!����������NLb�ꚭ��B���8�c�}���/��G�7���>8���g�����1�)�mu�v>�_\�{�E>�z�������S���ǿ}8f��/10�9����[����c���m���e��bhԿ`�f�i�4�]z�z|m��G՜�G��v��1[M�?��~�r6�#�e�����83p�Z6jZL����y�'��9�����7��F����#-+^����x����p�Ԉ����?ji�ʙ�]z�f��	��<\cx�ǣ��n�ư�����l$8��C�W�/���9:0�9��F�����L����������#k���� XP`̊ѽ�]�lF7�����nl�{�10��8m�ѿh���ݻ���Fn�_>��O[㞡��v��r'`�ΐ�
l8��m��|�j4y�C�7VLi�9�����c���ޛf,���r��ڧ���hc9l�GLu���g��6O���˯�g��7-����@�A����|�~����:�����1M�Ι��1�o���A��Ŏ��Z�vu���ڍ��W�잼���w�G/����������H�3p�R��A�e&�@��K���Z��z��z�'����n�ӟ�]��[�c�O�}��z5�9��k�9� 1��sU�\'�g����gs�a9W�O��s��54=���k4W��n9g�0��d{�^�(�>�.R5�p�`�N��}>�z>�_��~���V�+��j��rg���ַ�'��+~����׫���>>8/��?8fp�#]���BHE��Lv�-�K���޼�/������������y�����I�o�ОP�<YW��MJ��`
l��;>�y�dyvk��\y��zL���s����������IAd<��A�o:�f���h��±�&��5,̸ �|��:G8_\ۻ���p�F�1aX3K�@�X5L"�H˔}��4��c~`����O�+~���wp4k�U G��b(�R��KG%B�\�1���Fy�l�b;<+����./O���"P7.�;�u��iK!܋�%�@Jz�����\`"�=���ʧ0^�-%�p5�t�N� �k�����B6<�1u`�����;ǟ/?����S�s����|t��{�1�#�p?N{��8�*�`0R�h�� x�T}�1C����֙��/kH��ŏ���|>�w�n���=Ƹg����;`PJ䥎�Ą�j�h�T�jz`��|���F�����'�l��p�^Q'T*�vJ�U"��rD̳���z�{�#�Z}y}����8��z-�뢘j�#�)����-H!�� 	$�(�V[���n��;/�8ؼ�?y\�?A�bӌ3����xz`[,��Xn�Xo����xb
��h��Ԩ��ټʄ������s`�Ι��p!�b������Υ�0�����W�9�U~��G�6)d^�H"����0���Փ���(�k�ꝰx�܄�6t�3�or��4�@�}�w�f4�
���Lf����>Nf�Q����hb�~@ϙ�UIS�0��/������Ng���A�������� W����b�ky� 5Vwo.�<�/���<�`��W~� [AJ>�~hr"�������N�rW���DKB\��䆼�9���!�<{|�e�8tey�B~X���O�,�V��~��43��S��t�� 	[��ٵ�5�5z��{參� 3�"HUnN��^����|,8��s4GQ`u���޵���wO�Y���[�7��қ�խ헇�܎%��J��1�eE	�$�LU;P0�.��k ��z��*�?a�F;1�oZvشWWn$��aL1�:�bP��o��3�0�`6�/����Rm��2�CC��'ܐ4�s�|���`3��鋻ϴ�/�O�6w'D>�%g���y���k�#Ǣ�:).�Es5�!���	Ͼ�g�轝���l�{����:����e�+/��Kd���`.4�i���b ��+=���nԳ��	��Ш�\��H8NGk��j'���A���mo� x�����V#�Z�x���+�+UT�84	� #�� ���!�U߫h?�6ū�0c�N
0�<���D���	�٤�������0�����R����Εc�����էO��80�y��#��L�:��n l��27
����]>��~�:�ދ�y��VFp�Ƒ� 
��ɘ�N ?4��O�qd�|��r�D��+@U�Ǘ���!��ե��Mf��Ώŝꙿ/�T�\Pk���(j��i|L�Q�ʘ�x�����f=���)��ݏ��a��e�y>��Z���j�gp$�rd'	n�[��"E>/N^;�[y��hG
�*�沙0}7l�ݭ}�v<˱Ϭ���V�`!kv�c��e����q+�ke�{�^=�����Q=T|C��8~�[�`J^��ণ~Da{��p���7��X�P	]�RI`��T�0�>7�{���:P]Vj�.�?^�ԋ�Dҵ,߳1O���O[����c�w
;�14V�OmbP��u4�.�09 �ݖ'���WW�\gNA��w�fp�O0V����(��'*�����L�c�=�Q?�Yl����wNb'வH_0E�l��>tX��έo 4G��m|��`
�*=�IS=!��4S;�0�y:��0_�����(���={b�7]@,5�H�v�
-^'d����0��".��~U��fv>�3_��6+��^֧����&p�b!�pǘA�*<�W�Bߕ�����0*A�AiS��^|�6�>���G�.�<��� ����k R���53=�&_�L����O��+����|R�.0C����󓣻�_^��U����<�
g�¡�c�G�W/v�(L��fsf�� �nN�8r�Dw1�)��'��w��~ھe!����z��W׽`g���C��-d��a��lҴ�w�����Ov��?�Ag�f���YйS�P�8�)j9����~ug��ux��X.�|����p]��ʏ��a���lAi�V*aN���k�G�d*]�^�o��bB&=(P�OI�X�I������ ;N��K�]��{��囯����ZY&�2��~��@�TŰ	+#Y���;��O_^:���)����;���%W�8�6���Q��(��'	�>c�����c����"�g��]\+�텶����,�#�Խ 7�lc �׆��|�4�1��5Lo47z�K<'������!U'�d���[��������5�>����Y!g��aTL��ja�d�Ib&���.*�J���B�q�y�
�K��C�7Re3�1W�|�\� ��"״>vE�%��F��6"x���.�<C���?| ���k�F��(&^��Q�Z2d�3��T���.��;vj=ߗ,!Lk�!
78� J�ɡ�A� �=�Dy�Q/�Y3R�}#	�<ۆ���<G�b����c�=n�x���a�Z�؎Q�ڝ/�,�7lOS"�IW�4��<��l��^=�.>t�6��䡕�~+���;6�Ou�h\f�zp0Ǟ���P&�7O��p;���Q���|�r ;�m�j�"���HU�41��d��.D��w��>�� ���_�7��&^�<x�̲Bs�ҳv�c���2��<��y��&��K    7,L晊s���Qd�O��#";��s_�ߗ4_0ߓ��)=+�_,D.w��	n�ӽ�� 1�v����σ�!�)�0��pN�.=Z�؀����=�:t���-�~�~�|���&̘�tIs17<�6�: �5��|��y?����cD$i�.�	A$C�S|�j_�B��^c��1�{���/bn�yqힸ�T�_!��lE�J���*g�
Å�l�8~��O_,��-_�?u8)`O���G�i��Kl
�H(�'~�zbrx-:m���)���;T�<h6���^�#5���~~��7F������)��M��!^x���r�v�~i��ә3Y�������ǚ�m{��^$�חK"I�VKW��;R�������;��=��}�N� �LGyxz޿��|�P�B�L��x\b�����yzM���v����o�6ns]�'�Y�f!�ʤ��J�;�,������[�L̈RU\p�f#��/�LCG�c�����oA�����S@#]�2'�&o���Ǆ���i��X�����;'/�� ����O�=���C��R���F0�{�Ǒ`���I�kJ��aFG�9wi��#�s�9p�]Yl��&K�r��	j^��(��D��A*k���u���#�u��S�}���."��=�RR�m�ͦ�O�������O&E(�7��Kz~�[N�������O�;ѓqn����[���df��BG��c�y���p
��s�����	��TG��,q�PLR�D%�B�4���ͯ�>իCWo�")9O��"v�W��*���vBp�uNc�I0$@�i�o_ٻ�����vP��+�悞T{p?7ӳ#�R�m"b\<���L��P���*��W"usx���<�����'�<�.�x�<uE�uMU��b������4m{ع��($ ���ֳ�-ӭ�̑v���u�M!�4Ť��#��*������|�.<�uQ%� Y:�W
N�!��9���6���Չ�y������`Ĳ����q�p�<׶<W��#m}xk�Q�����!'���N�Q�]?�r�r��ɉ#���98����7�����7˫�ھ����i[�O,!DB��(�0��9p�)���%x����b�0"���a�T�ϴe"X����6mا7J�����2������;���7c3��X#B�uu�ڞ�G�D 5����im,�8���WF$�D�33�pIE�|�Z���|<ƥ�ۛVyL��{��Ō;|hy=���<�p�?)� �ֳ���v�� �ܚ&�e��ݝ��R����q�=A�=��zu���\�v���in!AS���A��xڈ��\��w�N���]�lu� y�X��0&�������!O�����*�
�����hl�j�v]��� ��GX�Á�9d�W�#ۛǷ_\��(����粪�0��8q!�yaɕ�c��p�sv���֋V<��_K.�0�9;����&��f�[�����/�<�.�CQ��c�QN7�u}lN5Y5��lo^*J1.�,�F�LQ���T7��(��C<@Z
o'���P���R]}��p][nR	����U��=C 4[vH����X6����#p_~��~}}e6m�Тr;>�"��ޑ�adNM��02�������<��"!y��1��Hd�2I��[������{/�:Ƣ�¸��������K���<7T�w>������n~�L����}�N�JX�I�b*G���ޝ>�w��Z���e^uy�,@0h�]�5g(@�G�B�	i���9�T���8�z�]Y���y�{�L��84����9�\p�g�a�.����{��RU����r���JTM�$�%2G6=c8
=���-DZ=�Z�8�E�ӊ�5��S�P�"���T�\s��z�VA$V	�z���*C�Z����}��cV�\�O;[���W;����˫f���h�	1q�����>� ��O�lo^[]xЯѝ��>z+3�'ɉ�aHz1��O�ɕ�����[0f��S_eY���I�H/��L����̆�p_���my�hmq�X��1��]��4��$�H�if*n�͑w޳'��wV�.���� �;[q�Z��n[�\�ط�K��H
e5u0.��c\0SP��W9̓�����rB�����dM�0A�q�Zg�r�m�=A�jg���3Ɠ/��=�"�O�{x�"���kB7&$�v��)�-�;;TL�j>5����5�/�����eTj~M�)됤�q��a��`�V�|J5bC˗'��O���=8nۤ��#�@�s���w�	: ��N�kK��Z�����ʱ�g᪤��PC�I�N��{�l���9����px/�m��8�p�b>�u,x	ܫnj���EZ��i�P��~���ԦQm��47Q�t�W �ݲx��#�gO��+�?-����'X�b�fH�i�*�N��_{���R��H���g�Y'��p~�8��P}� �]g�bk>e����'JF���f���k�(�B����P�! P2��+��Ĺо��]�*�r�,� �,#M�d��A�w���M�E߹z�+7z�����և�DV\=���#d�}�3L�n�HiDs��L���ʚ������p��hx����ͨ�ӱ��	VNo��n)RҶy�	K����ȇ!�,U	C�φ�Ԋ�0�	ϗ.�.�@p��US��W[�7BYc!�	I!S%��*L���ˏի�CX �^g��B�%6��/  *8���"n{���������hD�D�#����,S$W�]��[]�PT`į�i� ����׬/S�M��8�1��T�,@w?^�8_���W�nT�w���q��Y��k8�����q\2�A�c�՟!J��p$��+g!�D�#��(�K�>K&��A�a�a3Iv�O?�/s�<�&�	��{6\fY3+�1Xs�ੋ�/���Q(W���L�&&�R�d y�%�y���ޗ�K�߻�xk�*#B�έ�.�|]��$�UMc���|�g��O�ݻ�~ar���!���F��g>��bV{���[��9��C�0b։� ��0^!�L:�M���С�tĉg��oo]ĕ]�ndAy�l#ӔT$�� s��O����A�|��Z�>u�!T^Xā�g��󆉅�����?�A����6��(���Rb�@���
�ϙf��cE������{���lc�� Se�3��(��IC9Æq?��UH%l}wb��E�r_��K-�tR�b0 �M7s� e�b��/N�X�F�\�n�Q(Y��A���g�0f�7d��
@���E�w�h�w{Gp<n��kɡ��խ�5M��3Bqb�H��e�9M!�?�w|��z��0��x��f/�E:�����ާ|���F��̓p�y�W�ȑ���$ҷ���D��ir><�V�<��7Z�j�'���"��J�����x���1V��H|��N'�]�31����4C���#�ilXC7	O� ����ջP��̃~hkTe��p�8n
T9�-Ru��:�9M7�Iг:sj���;//�"� ��VO�kS{�p��bR;TE%���-�PR����tb��1FB�r�J�`�8�萡��.�B�o[$ކ<9�b� ���~�
�G*�qa�ls〳�wy�=��j.v@ſ�o���Ɍ�R![Cwy���'��<���밁CQ�#�}˗7ਣ��!'ed{�`[H�aF[�Po�hn���m����Lӄw`(YJ��\,f�̶����g�T�v�*.x���uDO��Y��,&)k��^�~u�J?T�[q����e�'xx�kY�	22M�rw�X��K�=���兣u�G��.��E#��4~��v�(����~���5}��աPĳ5�ya���M�o:��7o�Ѭ���!�E�A�o��[�����B�0a�݇��$�Ϊ�1�+�<ռ�K�E�Z��dL	����W�z.5��
$�U9�'8�Ll�[�7vL%^*݃O`��F׍*���HT��X�m��DnX�    g����{�zi�W�.v�d�Cg�����*V�L���Ie�b'M2�ve �����sѣ��h��l��35$����ȗR���N[e�ߗ�{�R,�:h(
+�S!Y/U5A�5��R�l_�����,>���ϗG��2k?��:�wJ��)�	��d&n�YBH_�����W4��['���x�����:���V�A����V��`"��������e��&ǸG��&�ad��}�pܺp`���HQ�-ۄ�	��Ŋ��Ǝ�U�]W7�@�k��pzy�	�_h`^�Hf�e7�������� ��p���Tkk��V�}�j���y��p�����k�_�ŧnd6'�2�ݜ�_-X8��GJ�(ƽ�d���!_���W�^��l�:a���i�f�@�M�X8�E�7��A*&DX�Q��E=K�T��q�U
��Zӹ{�Cᩚ��O
�,�.��T�4��o��������P?g=H����o���N-�t��,A�0"L��ܚ�S�&���>	խg�-."�H]�6�Gh�_չ�:n^<tYA�˦,G"�x	�ٸ3�"��C�j�V/�#�y6��)a(`Z&��B�G��𩄵0O��D�8�Q<���.dF�cK)������}{�jg�j7pT�s�s����Q�ja$��:�y�0�h�#y�N\=�/vO��̎�0Jv��f�d$Yéz<d{|^�A;���Ib,�rjt��i�h-h�O��P��x���d]��z1�j�N�㦼k�:q.���&����16���*�I�����.�v�+�L�\�e*/2��=�_�=�|s���A4h���7p>�b1�`���s%�1�V�+��O�m�
d �����ޛm��7�tg V>����t.w���jy|p�x
|����d8LS���h�8�����Y��'�BPc������0!�j��W�ד?�߽��Z�]�e�N�8�}
ME��kQ:����u������#E`��K�CP��Q;zӋڋ���#����}1��:��Xx3�qP�<[Z8zm�Fu�9L�(��,0�,�,T�����c/td{�z���F�������ՃD5%�"(��,O���%4���m0�[޺��!:��Z�<6k.Eؖc����(U�33N�P%x�4C��M��:T�k�`m�F�ГV%5��()��g�h8$��>��a� :����.v8cy�a�Rd�Sy�r�!�l��C�}��!��a�XJ��Y��*
�"B�=9飒���P�����8yv	�h:Ő�O7���Fʋm�7�0!�Pt[�0�T�	�o��Ճ����P6�H���vd��-υޛ��0��'�<^���%a|�b���.ӵ���P�
왃ٔ���:7?*�C����ss1���� Accp.�Eʼ�^֌I��qw�9|�G������n+�E�S1��	u��e�2�6�P¸���h-}���,zul���׭:l�:8�1L�{��U<�* �Lm}]�:�H�C*jɟ�~����s����v^^#]IX`P̄E֘��h]c�S�d+u�a���:N��(H�}x��#��˓�;nB)��ǬղG�q�d�.Zo`H��a�.�������ҫ�^��c��2�1�5�ďY�]�we��:�Z�o�m�?����~懙VE��J�\y��A����	�e�f��Ձ�l�`�><4mOtH�IE���6){_\[�;t��4O]�o=@�|Eb��҉c�sgHq���#��x��;�����j���d"PȘÈ��P���F,/_�g}�Ce5Q��y�m�j�c���9D�R�ٜ�"�M���g���G���h���ݍZ/�n^>�T���� �x?�|HӕbX�v*z�ɬ�����J��F؇��;" ��Vq�١�n�GF�A5LA׏v}�	RBIHE�d�1g����;��T8Z��;��6b[����iˮ���L73�F��zm�ƥ>��w(F[ᄂ���ҳ��[���t�
�n�<!�d��)���_^n}ky��S��F�X��JZ�����j�6]�aC����Q�bo��1l�)�Y�ؖr��	�}�b����h�с'����E;�$�<��x��aCu10}K�x�3]*v�Esk�+<�*(Z��b�� 1D����Jz>Bv�9���w]'��;>����h�ALX>�a��x b�>yQ�����w����"��r�I���Z���$Gv2L�x�^}�hy���x�:y�_ǟ� ����*eNd����it.�0ٯAJ�`S(��H�[�ȁmH8��MI�@���5w����VyC-Q�.Ć����F*v�i�@�Hް��ݷ��aR0bR��g���h'P�$�`ES��������ĕu�ˍ�Q�d�mv�;�n�7g6�737WN-o|U
��J'�����3��:����C5�T%�܅%X>�^�Ȅ� g������.+S�NB�I��=UT2���d����QH���jvӍ>t�{Ћ5_��\�"JlU��@��ͺ�W_-���s�T�ҧN�sz��n��3���YUJ0�4=B6뀉�)zP�-����Z,�x���8"W�0!	z���>�YSl���`�A���.�ȹ���uۻ�;h/��xjш-jY�6��GvH��dL��� ۍZ��MI�qE���Ë1�I^�3L���6�9�/���AV�F����0Fh�����D2�Fdf����a��G-�_?P��P�E*\�纅�(e�.a =Gk'����
��
V�,��%u�������0��]�gk�MK�b<i����Ԇ��8�u���| Sȴ�S��9I�@%�t3�5�����2��k�;�Q��H	N#c˙Qm�?�z�uex}
��$L�{��ڀy�B"f�=]�c�-Z<��ӻs�5o��o�!BÌ8}�⾵0}Jɶ�q_�	����+0t�������ŏ��)�Q�"4���;S��lE+�[��J�I�����'��2^���S�?���o�"u�Q��H��� �iy:vO���?@���c�ں~��
yrx0�~f�3\�@3�������[E�����ߑ�dMU� �0��P$���x�Ii4/������c`9=ု㬢+���n�nCo����N�w�sv��%�8�j�{�g��л�8�mb(�[���h�7k�GX�Y^�Y�Y��,�:�V�4;޿�����/��y�Tc��/�:�Q$�R$di�C%,5�0?-u��2�fT�+m����Z"H���͑q��)�c�qi����x��E��������<�=Ĕ��	�y��d%|���C�Z�R��A�����e`Db���竸̆�:��~�s�([V%�m��V�&ϗ�]�jm�H�T`;��LbUI�70L�̟�r�����#����v�詠[�;9��)��]p�wA�lS����~u�9���΋���%&8O�m
��y��+�����Bt���޾��j�N
٧\�g�mid]8���`7�(�}��7;���V����]��G�����M�4T�a�ό�]�*�˗�u'CRi���QJH*酡�q�Q��P2�Z�9���Vy^�n�'ecQ���Ha�[uS�Ō~BU_u*r,6F��VÏ��V�vn�I�i%W,�O��w	d#�y����ْ�0`�7�E�pJLK�}��9xJ!�ş�qsa卖�״Jy�i«R�"^r��a��@J�[ʜ��>0� )r.��ᮃ��92�:t�uT�� �i��Q8�l`�B5����Q0^3�Х�_�Xÿ�z�.�bp��'}i�����ve����2�$E�*��'�vn��Su��!I�@s�0�b��I%T�Ms88�@�z-p���B��^�d�髶��j9�(��F�a� נo~zr �z�!j�g-��k��h0�+�c`Z�1�1R�o���#�+
���"Ä���P"3pw���ڼ�dݨ���h��@~����8�")M�S�ƌqs�=�����=i�e���	����:�`˲c/1�    �OHg.��y�D��5B��P���E$�F �~�J��&� ������:ն�,��4|�0)L��ܛA���f�Vl0�y*6y������͜�w���_�*��K3O�� ,C'�T�.jÞ���:�^�\���v.�&2xM�%RC�e�M�z��V\޻���Y��蚡���0C��cA�� ��c��,:i���"=��<"�8�u��4lW�鮅��T����*(�.� ,OR��2�eL�C�GB�p�T��z�S?����7RI��W��3E��\y��A��_,<��w�I��������|�p3�zq�Ӱ5���Mb��fட��H6���קF�v�0�N��E��~ӎjd��*;
&�PM{��R�z���۝vj�z/N?�<lJ����� �)/�r8���Ps��y.������&��$��Ij��SV�c���q����8��FE�{�h��aeȱ/{O��0�P��Ս���򇻝��q��'��0�L�u����p8��LF�X8�=�QJ�7L7�;��v��u"H�6� �L蛙�;����յ�e1��ĕ2-��@���Nd-\+e�BH�j���{|���{��gk��:���zxb�䦋X�\��r���̤Ip�U�%���k��\����oW��̅����rb�~�ZWw�j_�;��z� �S�8"�Y���-���S�7?[�:�����J��O��M��I� �1=Ԙ�P�r+J����������'���:*|u_�3����}��,X���r��if�3-!)�,qf9�e�g3o�(`fU�l��س`�}��:a��e5��?�*�U�ͣ�$e	n"�1aq�m$�>�t���XU�'�W������C�&�)�w��uS�r_��XA�4V�ȫjl�n��lb���t��:U8-]��"{b��Y�qě<���,�6I�|�2�>�g1�$"�tޕ=���PG�V9&�,$�;�6o��/���*�B��J<�C �~�fä&����{�
�3�ePNK*�b���'��!3mU'�������+˽�A#���&tk��|BƦ7�`�L�nY�76 �j�u�(�5����Q#Q��v�h�)���r���Wa�����S���TZ��+Eq
�b9$�E�c�1溝�0A�gO�n<�;rou��.a{����?���}��".�89ӡ��&)2�߂b��s�4I�"���#�E��$����HmBX�|��az�13j���m�$L� ��DFb`p�!��{�y��]�����5�ٶ އ����*��b:(1��?��Ai���k�gM�A��i�i��̪������x�����/�,�I�Z�J���&���Dg�\)���=��-�ٸ���q��xŖoұ�epw5τ�*��b8��@1���+��u�i�	��v{kt���\UT!!8x����I<\���PR�����v�"IJw��f�MR_wܔ�5p*�L�+�<~>�	���EAD�͚z�x��M�Z��"���̇0Z[�������=�$��	z��a	�?��d`B���[�!.ɧ�Z���fGKe�/��������!a�Ҽ�!�鍢��ZZ��cZG�~M��|�4��\��i3���ɺ�`���mF꼚l�$�Cp��$��
��	iC�}7�k7[e(5,d��!���^�'�IX1��2���w��`�-�i*��~�Q�Bu�)c��j��ϙ��օ�x/w�X�n^��Xn��J��C�h���CČ�}�NB-��Y!4���(�k�b:�3��#�V�����M��y�孄z ����&����*�O�1��� �*���ճP	�׽��ӯ����[�)�0Ҫ��P�c[M0��� �wm??[*�����qGWW(��i�� x�4�@Q0&�k����{7,��w�L�c:N� �CWUB0�(�,�ǜq�k�vJ�ʁ':�[���Ivp<TD���c 9M�K���~|�#�P�y5���{^�=M���A������������m�j7�s��0Cu��o�FGQ�1&�N�H0z�	8�;Wo���fE�PT�OJ�)��eN���v8uqw�A��+���>݉�EZ�AV��Y��	?���6��	��w
�j��i`���ć����(�;/O�K�O�>0F�o�/t�$�����TaєBX~��.�z�x�����K3�[$Y�M*Yda�(TUBO��h��f?&MU,���k�j�)^x �&z�xU>��{r����D��V,��g�U�l��.c�*'	�u�M��T��h�1�le;������`u�K�.�/ҼO� 4����czo3L�P�&(C]x�s���V�O���[\�-$,��N,�����R[O��a���7.&��.�%�~�c0Ӣ�^��zR�1876�_|�|�
�l��������5�$�Z�$��x��+��� ��%�Cb�R�̢�F-u��!\�%�)�
{=6|̎d�*��>�S�ה���۝�^d�NǢj+�#�FE3s��T'ɹyB�G�)�� ��>�Q�x4�V;�l�~	u��ŘqvP��mr�&"�Wcj7�mF<����(��wy�A�n��
zj�UH'���6���(�Bꉆ�2���W/� V{ԎaW;^�r$RLFY"��#;�i��kWw�h�x�/�6������*�������Kp��nL��G_C/�(�.+#�4-x�F�g���|��m7#E��� �լ�)*��}5�[�!�&I��;Ut�iB��}y�,,�Ʒ�C�R}�~�E�3=�U#Ue"X���IưybG������`�n^l�Gu�Ei��V;n������8�5��.�����9�	�F��U��n�jKdi�fH*Qh�|v��#*x`��x|cy�D���h+3�9=�6}>����3Wuq1E���9�{���ka�ᄋ�,��LȅQ��8����W��T�\�ڇ}QV!��0ՈD&M�3B��l̓���Vǿ_��>�XJ�5�t���-OJ�b���_�^:l�Ѡ�]�����)Ƕ�K�H�#�6��ffh-� "3�eG�6�{�>�نBN���.�����`٬���taD`���
�� �,g�ys�T�h�"��6���KU��y �"4�a������km=��}�x����HqM�,dF�����Hݴ�O��b���~�. ��(T���XK\a̳m\f����ڣ{g��a�h�IH!#K%��22�1M�񤩨���ڱ��`�7�nQ\0FY��ܻRb&��%,0���x�$�_��;�E/�痕r�Q���(+^2��c��AGU�����]���̶�{���-b�� �402g,�����?y�z𤈶uDU��j?���G���7�i�x��H7��;�x^��~��iG�Q9�H��"�dK)\cu��W�����;�O��I�˟�<48��s�z��~H���4�Eޮ,H�XÞ	.ԟ�ɽ��.cD!q�$��Fq@(6����9���9���)��0۴8-.L��0���Sx�RC���ɱ�;�N�k����O+Z�Kű!���������P��ޥG�d�������B
-�a�aS��)'FYj�B\fb=w����I��w%�Wqk��a9�7�5	�Ӡ�#n��
0�K��KEu�2�RMi���k��c�n��FT;���&n�4/�@T�A���!*�1k\m<#�_"���,���O(��A�x�b����C� �;��y�(JM���-�!D$�˲a��ɨ�C|����>s�i�kZ��󵩉iFJ":P����Sc,���"Ԅit���ˮi��AXyY��ד�C�<uq�j�U0�뫡O��nq�E1aF�h*���#'�}��@�_�k���I�1Z�]�T-M
&n*�H֝�GwΞ��szڸ׶�<o��ۂ��Oji�)�C����(ۯ6�Kw�Xkɷ�Q)�����ǆ����O�H���f�e��E�>?�xE�U"��X֒�'v��� �  ��޵N��m����kC��<t�i:��N؁F&C�SZa[�D�5K��c�0��t(�^K�6.�I��+M�u[$4;�}J<UK<3�1R/l���3���y�b2 �S�&6�dP4���
;�6��t���e�ݔ|NE���ьԈCى���+��v���zu]������cy��J��삭
<��M�����Wv��<�.�|}��GU�ȡ*__7]�M��rd�`�XY(E_Q��;�M{>Z��� ����^��B�Dǂj�a����pRH�	�7��}���e���v%Ҷ��-a��Nߢ'N�W����@���p�e0m��;ݷ�}+4&`�^��>�:T�5-^�Ԕ��}<�VcȞћ6�~W�I�B;2ɀY��m)m�76C�OW׷���ƙ�Fh/K�frj�af$'��_v6�^���݅7�^x��aʡ��[[�I��T�Aס�
6�(�P�S0��
�2}Bv����@ ��L\Lm��q2ܰL��k��FU��Y�ĽR�B�9��� �ޗ�׼_�=�̦�[��"U���L&f��7ggMĳ����jL� �hW%Qա��ۂ�,�"R0=���s8����:=��j,��{r�ˢ�A��e�d�w�5`��ε���H��e��DZ�eYi`b�r(������o_և��=���$��'>LK��f��~|uh����>8�zp�O�mvZ�D9v�P�t[�f�!Ὢ�? �>��;�O��߳��z?5AO3�	DN%,���u��)�C������aӝ��Y�f�a<�9��G벯)���Kղ.eٹ�)�çP�/�0�Y�p?�8{X���߭�?�ay��~Jj�L��n8���ݥL(v>�(�Su(�x+�,E�1��d8��c��|��i��|ѿ�����W'�R�jm�����Ğ��_N�,�<���[����W���$�Y���?���ۉ�Dp	)�Ibc���N��=�dX�A:�3��ɰ�*�U3��@V</q:�#;o�MCP�AP��UҔ���e���4�m&�'�2ގ\�Y�Gp	f�V/9��(�Ƣ�����!�@� E��0�1�m�]".

-��_�aq��@U9IO\"IAL���Z����l揇��Ǜ��k�*�V�	)�mB�Ɉ�0��Fd���L}�|�C�3.�V��1e>#b��8��[�龇d��XN���b��vWgT`NPO����z��*&@D�Z����E!bp�X���ވ#�2ci%�D1M'�`w��c��y�켼]�ه�{�G���q�b �%.V�̏(-'Q*��QK���͞=���FK��e��t42E�g�&$��ͩ�IA3��4���n����놕�;Ͱ�T���X1�b�m��S0)ȷ�+�}�cl9Oqa�^ꉎ���z���h$��~�cj(;U�o��G����]^�1�:f�V�Л�v��9,��V(�s�"�J(�(�0���y�a�����$գ��nx},'9��/�^m��6RI�=�<R^tL	'��2�u��_��c�n��ۍ�U)���)Er�I������а�� F��^�x�O���B�b�qp��U����F�鍾MU�������B�X���B*
�61����W'vN��{�����F]7�cGO�u���Ҹ*0���bȖW�D4L���5-+V��'�b��oT1��$G�)��Z��,�c�ǘ��B�)�/��8^�~��&&�Ѫ!h��z|b�N�@+�?�*7�����=�lI�R�� v���G������d]D:�m;�1[�m��;Gn����/���+U�]�I2k�[�K��7�/��R��Xd�;(�P�e���Q�(��(jP5��h���ŒI��)h��N{�z���x'5�*���EY��j΋�e��B�c�N��[�l����!���R�>381=a{�IX�/*��A�l�T8̇<|s�(;��	M_k��/���A���E��1oDEw�^�;Wс�����e �E�0�b7��b�.�jr+>Ҭ���#�H�B(�� c4���1�4�@v�wSݣҀ�&ϲ����C�C]&_!=ٴ]A�����P��ԡ��X�&� 9r���E)�RjcG��g6kT#�w��"��(mR���l�w����3�#���qγ̽e�"�By��	7���e�8�����m��⛫��;}����åS���p��o~��j��lU7Zr�;h�/��v`2&�3C� �	��x2�Ϙ����df�y�G^.#z6a��3C������f~��y�A�~St�|�/����oް���y��fH{ǭ��E���g#Y볽�|y�V�-m�.\[ݽ���dՅ�BG|�rs�,����y���T;��fcd��ݧ���sܵ|��n�ݩ�ǭ!U����d���RL5?�}xL�d!�W�30x��;ܟ�\p=9}қ�a����"Ơ3�������i�������Y'?���k�A����BL�F��b�b�1(e�J�1y������ b�-��eAV"����#x�
��oJ�� ��~��rɺ\��O&�k���Gi�~@�;EP��턚�mB_�O�L��j�2�� ��q]������Z&u��˘B�A����R�^�9�=�k'�ӨK���{�?z�/f�&����?uGQ���/�����_�����]G��F��>H��?��z������&H����>��@s��Ĉ��K^$���?H\���a�J�,��~;����޷���/�f���(t���oq��뚚����K�!?�7W\�<��9�����7�����M9�j�����X:~�:��~8����U���7��F��j���oh��O���(�-��!�@��}K���/`�`�t`��T�~��U�M��(�`ip�1�8��1��sj�m<%F�є�������WPI����E��@E�Z�2k-Ho��pW�Y��#'b������������?���~�72�)$P����pDR� �r5cz�(��	g����Q|�]��������j6�O)v��Քb�٘fg�4��1��ˎ НL��2��sz�P#z:��!!w!U��ˌK����l>�ҳ�&�1C�?���3 #1̌�K9�ل���A\������~>�=�Fp��hF�/~�P`#�֣�)z2cg�]�>�g���|h����g����f�|D��f�._��O�9�~�tW��g,�j���o��Ԝ���:a�?+�?�e�?�G;��)�0,[l~�F45o��G��z���l<��#�^�LM��t>�1���Ǔ��������!������u_�����Acd?��2��{���7����π�����P��2���ϷQ�o�U�of���7��k���������ї      &   _   x�3�|6m���m�F��Own�|�}��݆�g�<����g�Tѳ[�O��|�L�P��T��d�9� #�0F`��c������ r�aw      �      x������ � �      $   1   x�3��I�442615�,-N-�2�LL��̃��9��%E�%�E\1z\\\ Y��     