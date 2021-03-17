.. Documentação-Projeto documentation master file, created by
   sphinx-quickstart on Mon Mar  8 20:11:22 2021.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Computer-aided diagnosis for excluding active tuberculosis in contacts of pulmonary tuberculosis patients: breaking the transmission chain 
==========================================================================================================================================

Despite being preventable and curable, tuberculosis (TB) is 
still the leading cause of death from a single infectious agent in the world.
Different strategies to increase TB detection and completion 
of treatment in the last two decades, which comprises a four drug-regimen 
for six months, have not allowed attaining the United Nations Sustainable
Development Goals targets for TB incidence and mortality decline. 
The WHO and the United Nations have now specific targets to eliminate 
TB until 2050 (End TB Strategy), and TB preventive treatment (TPT) plays
a strategic role to attain these targets.  

Prevention of active TB through the treatment of latent TB infection (LTBI) 
is a cornerstone for achieving TB elimination. LTBI affects about 25% 
of the world population, and those with a high risk of progression to
active TB, such as patients with immunosuppressive conditions or with 
recent infection, should be treated. Contacts of patients with active 
pulmonary TB are the largest existing population targeted for LTBI 
treatment. The United Nations declaration of 2018 recommends treating, 
until 2022, 6 million persons living with HIV (PLH), 4 million child
contacts and 20 million adult contacts of active TB patients. This is
not an easy task, because the cascade-of-care of contacts includes 
multiple steps, from testing LTBI, exclusion of active TB, and treatment
prescription and adherence. Many losses occur in all steps of this cascade, 
and less than 20% of those intended to receive TPT complete treatment. In Brazil, 
less than 2% complete TPT.

The step of active TB exclusion is a bottleneck in many low- and medium-income 
countries (LMIC), including Brazil. Currently, WHO and the Brazilian
Ministry of Health recommend symptom screening and chest X-rays (CXR). 
The risk is so high in PLH and children under 5 years of age that WHO 
recommends that in high-burden countries (all LMIC), this step can be 
skipped in those two subpopulations. Brazil, however, recommends CXR in 
all contacts before TPT can be treated. Unavailability of CXR and the need 
for specialists to interpret the results delay or preclude TB exclusion and 
the initiation of TPT. Changes in the lung parenchyma due to diseases other 
than active TB include sequelae of TB (fibrosis, bronchiectasis, cavities, 
calcifications), chronic obstructive pulmonary disease, acute cases of 
pneumonia, tumors, adenomegalies among others. Several pulmonary images 
that appear in patients with COVID-19, which recently reached thousands of 
people on the planet and can affect more than half of the population, even 
without causing symptoms, can remain as a pulmonary sequel, making the 
interpretation of RxT even more difficult. Computer-aided applications have 
been developed to overcome this barrier.

This team has been working on strategies to simplify the cascade of care of 
contacts and PLH to scale up TPT in LMIC. We have previously worked on a novel 
serum-based test to exclude TB, that had a high negative predictive value. 
In the current project, we intend to validate one existing application and 
develop an application to read CXR of contacts and distinguish (a) normal 
patterns; (b) parenchymal lesions non-active TB related and (c) active TB 
lesions. The developed application will be available for free-of-charge 
incorporation in the Brazilian public health system (SUS). This would allow 
the same-day exclusion of active TB and the possibility of TPR prescription. 
To this end, we will work with a multidisciplinary team that will include 
specialists on TB, public health, and artificial intelligence-specialized engineers.
For machine learning, we will use a normal CXR database, from participants of 
two clinical trials of different regimens to treat LTBI, and publicly available 
databases of multiple TB and non-TB CXR. 

Main goal 
---------

Develop and validate a computer-aided diagnosis app in open software,
with reproducibility techniques and data-quality, for SUS, for recognition
of exams without lesions characteristics of active TB in persons pointing TPT.

Reproducibility
---------------

This documentation provides a tutorial about each tool we developed for our software.
You can learn how to install and use them by clicking on the respective directive.

* DataReader_
* ImageService_
* ImageSampling_
* POP_
  
.. _DataReader: ./Directives/DataReader.html
.. _ImageService: ./Directives/ImageService.html
.. _ImageSampling: ./Directives/ImageSampling.html
.. _POP: ./Directives/POP.html

.. toctree::
   :maxdepth: 1
   :caption: Project's directives:
   :hidden:

   ./Directives/DataReader
   ./Directives/ImageService
   ./Directives/ImageSampling
   ./Directives/POP

.. toctree::
   :maxdepth: 1
   :caption: About
   :hidden:

   ./Directives/Project_Anete_Trajman

.. toctree::
   :maxdepth: 1
   :caption: Contact us
   :hidden:

   ./Contact/Researchers

.. seealso::
   For more information about the project, click on the about_ section.
   
   .. _about: ./Directives/Project_Anete_Trajman.html
